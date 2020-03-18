/*
 * Copyright (C) 2004 Carnegie Mellon University
 * Written by Håkan L. S. Younes.
 *
 * Permission is hereby granted to distribute this software for
 * non-commercial research purposes, provided that this copyright
 * notice is included with any such distribution.
 *
 * THIS SOFTWARE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
 * EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
 * SOFTWARE IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU
 * ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
 *
 * $Id: mtbdd.cc,v 1.7 2004/04/29 00:28:31 hakan Exp $
 */
#include "mtbdd.h"
#include "problems.h"
#include "domains.h"
#include "effects.h"
#include "formulas.h"
#include "functions.h"
#include <util.h>
#include <cudd.h>
#include <map>
#include <stdexcept>
#include <typeinfo>


/* Verbosity level. */
extern int verbosity;

/* The reward function. */
static Function reward_function;
/* Whether the current domain defines a reward function. */
static bool valid_reward_function;
/* State variables for the current problem. */
static std::map<const Atom*, int> state_variables;
/* A mapping from variable indices to atoms. */
static std::map<int, const Atom*> dynamic_atoms;
/* DD manager. */
static DdManager* dd_man;
/* Total number of state variables. */
static int nvars;
/* BDDs representing identity between the `current state' and `next
   state' versions of a variable. */
static std::vector<DdNode*> identity_bdds;
/* BDD representing identity between the `current state' and `next
   state' versions of all state variables. */
static DdNode* identity_bdd;
/* MTBDDs representing transition probability matrices for actions. */
static std::map<const Action*, DdNode*> action_transitions;
/* MTBDDs representing reward vector for actions. */
static std::map<const Action*, DdNode*> action_rewards;
/* Mapping from action ids to actions used by current policy. */
static std::map<size_t, const Action*> policy_actions;


/* ====================================================================== */
/* state_bdd */

/*
 * Returns a BDD representing the given state.
 */
static DdNode* state_bdd(DdManager* dd_man,
			 const std::map<int, const Atom*>& dynamic_atoms,
			 const AtomSet& atoms) {
  /* This is going to be the BDD representing the given state. */
  DdNode* dds = Cudd_ReadOne(dd_man);
  Cudd_Ref(dds);

  /*
   * Set Boolean state variables to the values specified by the given
   * atom set.
   */
  for (std::map<int, const Atom*>::const_reverse_iterator ai =
	 dynamic_atoms.rbegin();
       ai != dynamic_atoms.rend(); ai++) {
    int i = (*ai).first;
    DdNode* ddv = Cudd_bddIthVar(dd_man, 2*i);
    if (atoms.find((*ai).second) == atoms.end()) {
      ddv = Cudd_Not(ddv);
    }
    DdNode* ddt = Cudd_bddAnd(dd_man, ddv, dds);
    Cudd_Ref(ddt);
    Cudd_RecursiveDeref(dd_man, dds);
    dds = ddt;
  }

  return dds;
}


/* ====================================================================== */
/* collect_state_variables */

/*
 * Collects state variables from the given formula.
 */
static void collect_state_variables(const StateFormula& formula) {
  if (typeid(formula) == typeid(Constant)) {
    /*
     * The formula is either TRUE or FALSE, so it contains no state
     * variables.
     */
    return;
  }

  const Atom* af = dynamic_cast<const Atom*>(&formula);
  if (af != NULL) {
    /*
     * The formula is an atom representing a single state variable.
     */
    if (state_variables.find(af) == state_variables.end()) {
      dynamic_atoms.insert(std::make_pair(state_variables.size(), af));
      state_variables.insert(std::make_pair(af, state_variables.size()));
    }
    return;
  }

  const Negation* nf = dynamic_cast<const Negation*>(&formula);
  if (nf != NULL) {
    /*
     * The state variables of a negation are the state variables of the
     * negand.
     */
    collect_state_variables(nf->negand());
    return;
  }

  const Conjunction* cf = dynamic_cast<const Conjunction*>(&formula);
  if (cf != NULL) {
    /*
     * The state variables of a conjunction are the state variables of
     * the conjuncts.
     */
    for (size_t i = 0; i < cf->size(); i++) {
      collect_state_variables(cf->conjunct(i));
    }
    return;
  }

  const Disjunction* df = dynamic_cast<const Disjunction*>(&formula);
  if (df != NULL) {
    /*
     * The state variables of a disjunction are the state variables of
     * the disjuncts.
     */
    for (size_t i = 0; i < df->size(); i++) {
      collect_state_variables(df->disjunct(i));
    }
    return;
  }

  /*
   * No other types of formulas should appear in fully instantiated
   * action preconditions and effect conditions.
   */
  throw std::logic_error("unexpected formula");
}


/*
 * Collects state variables from the given effect.
 */
static void collect_state_variables(const Effect& effect) {
  const AssignmentEffect* fe = dynamic_cast<const AssignmentEffect*>(&effect);
  if (fe != NULL) {
    /*
     * Only reward assignments are supported, and they do not involve
     * any state variables.
     */
    if (fe->assignment().application().function() != reward_function) {
      throw std::logic_error("numeric state variables not supported");
    }
    return;
  }

  const SimpleEffect* se = dynamic_cast<const SimpleEffect*>(&effect);
  if (se != NULL) {
    /*
     * A simple effect involves a single state variable.
     */
    const Atom* atom = &se->atom();
    if (state_variables.find(atom) == state_variables.end()) {
      dynamic_atoms.insert(std::make_pair(state_variables.size(), atom));
      state_variables.insert(std::make_pair(atom, state_variables.size()));
    }
    return;
  }

  const ConjunctiveEffect* ce =
    dynamic_cast<const ConjunctiveEffect*>(&effect);
  if (ce != NULL) {
    /*
     * The state variables of a conjunctive effect are the state
     * variables of the conjuncts.
     */
    for (size_t i = 0; i < ce->size(); i++) {
      collect_state_variables(ce->conjunct(i));
    }
    return;
  }

  const ConditionalEffect* we =
    dynamic_cast<const ConditionalEffect*>(&effect);
  if (we != NULL) {
    /*
     * The state variables of a conditional effect are the state
     * variables of the condition and the effect.
     */
    collect_state_variables(we->condition());
    collect_state_variables(we->effect());
    return;
  }

  const ProbabilisticEffect* pe =
    dynamic_cast<const ProbabilisticEffect*>(&effect);
  if (pe != NULL) {
    /*
     * The state variables of a probabilistic effect are the state
     * variables of the possible effects.
     */
    for (size_t i = 0; i < pe->size(); i++) {
      collect_state_variables(pe->effect(i));
    }
    return;
  }

  /*
   * No other types of effects exist.
   */
  throw std::logic_error("unexpected effect");
}


/* ====================================================================== */
/* formula_bdd */

/*
 * Constructs a BDD representing the given formula.
 */
static DdNode* formula_bdd(const StateFormula& formula, bool primed = false) {
  if (typeid(formula) == typeid(Constant)) {
    /*
     * The formula is either TRUE or FALSE, so the BDD is either
     * constant 1 or 0.
     */
    DdNode* ddf = (formula.tautology() ?
		   Cudd_ReadOne(dd_man) : Cudd_ReadLogicZero(dd_man));
    Cudd_Ref(ddf);
    return ddf;
  }

  const Atom* af = dynamic_cast<const Atom*>(&formula);
  if (af != NULL) {
    /*
     * The BDD for an atom is the `current-state' (or `next-state' if
     * primed is true) DD variable for the state variable represented
     * by the atom.
     */
    DdNode* ddf = Cudd_bddIthVar(dd_man,
				 2*state_variables[af] + (primed ? 1 : 0));
    Cudd_Ref(ddf);
    return ddf;
  }

  const Negation* nf = dynamic_cast<const Negation*>(&formula);
  if (nf != NULL) {
    /*
     * The BDD for a negation is the negation of the BDD for the
     * negand.
     */
    DdNode* ddn = formula_bdd(nf->negand(), primed);
    DdNode* ddf = Cudd_Not(ddn);
    Cudd_Ref(ddf);
    Cudd_RecursiveDeref(dd_man, ddn);
    return ddf;
  }

  const Conjunction* cf = dynamic_cast<const Conjunction*>(&formula);
  if (cf != NULL) {
    /*
     * The BDD for a conjunction is the conjunction of the BDDs for
     * the conjuncts.
     */
    DdNode* ddf = Cudd_ReadOne(dd_man);
    Cudd_Ref(ddf);
    for (size_t i = 0; i < cf->size(); i++) {
      DdNode* ddi = formula_bdd(cf->conjunct(i), primed);
      DdNode* dda = Cudd_bddAnd(dd_man, ddf, ddi);
      Cudd_Ref(dda);
      Cudd_RecursiveDeref(dd_man, ddf);
      Cudd_RecursiveDeref(dd_man, ddi);
      ddf = dda;
    }
    return ddf;
  }

  const Disjunction* df = dynamic_cast<const Disjunction*>(&formula);
  if (df != NULL) {
    /*
     * The BDD for a disjunction is the disjunction of the BDDs for
     * the disjuncts.
     */
    DdNode* ddf = Cudd_ReadLogicZero(dd_man);
    Cudd_Ref(ddf);
    for (size_t i = 0; i < df->size(); i++) {
      DdNode* ddi = formula_bdd(df->disjunct(i), primed);
      DdNode* ddo = Cudd_bddOr(dd_man, ddf, ddi);
      Cudd_Ref(ddo);
      Cudd_RecursiveDeref(dd_man, ddf);
      Cudd_RecursiveDeref(dd_man, ddi);
      ddf = ddo;
    }
    return ddf;
  }

  /*
   * No other types of formulae should appear in fully instantiated
   * action preconditions and effect conditions.
   */
  throw std::logic_error("unexpected formula");
}


/* ====================================================================== */
/* TransitionSet */

struct TransitionSetList;

/*
 * A set of state transitions.
 */
struct TransitionSet {
  /* Fills the provided list with the conjunction of the given
     transition sets. */
  static void conjunction(TransitionSetList& transitions,
			  const TransitionSet& t1, const TransitionSet& t2);

  /* Constructs a null transition set. */
  TransitionSet();

  /* Constructs a copy of the give transition set. */
  TransitionSet(const TransitionSet& t);

  /* Constructs a transition set for a simple effect. */
  TransitionSet(DdNode* condition_bdd, const Atom& atom, bool is_true);

  /* Constructs a transition set for a reward effect. */
  TransitionSet(DdNode* condition_bdd, const Rational& reward);

  /* Constructs a transition set. */
  TransitionSet(DdNode* condition_bdd, DdNode* effect_bdd,
		const Rational& reward, const std::set<int>& touched_variables)
    : condition_bdd_(condition_bdd), effect_bdd_(effect_bdd),
      reward_(reward), touched_variables_(touched_variables) {}

  /* Deletes this transition set. */
  ~TransitionSet();

  /* Returns the BDD representing the condition of this transition set. */
  DdNode* condition_bdd() const { return condition_bdd_; }

  /* Returns the BDD representing the effect of this transition set. */
  DdNode* effect_bdd() const { return effect_bdd_; }

  /* Returns the reward associated with this transition set. */
  const Rational& reward() const { return reward_; }

  /* Returns the variables touched by the effect of this
     transition set. */
  std::set<int>& touched_variables() { return touched_variables_; }

  /* Returns the variables touched by the effect of this
     transition set. */
  const std::set<int>& touched_variables() const { return touched_variables_; }

  /* Tests if this is a set of self-transitions with zero reward. */
  bool is_null() const {
    return effect_bdd() == Cudd_ReadOne(dd_man) && reward() == 0;
  }

private:
  /* BDD representing the condition of this transition set. */
  DdNode* condition_bdd_;
  /* BDD representing the effect of this transition set. */
  DdNode* effect_bdd_;
  /* Reward associated with this transition set. */
  Rational reward_;
  /* Variables touched by the effect of this transition set. */
  std::set<int> touched_variables_;
};


/*
 * A list of transition sets.
 */
struct TransitionSetList : public std::vector<const TransitionSet*> {
};


/* Fills the provided list with the conjunction of the given
   transition sets. */
void TransitionSet::conjunction(TransitionSetList& transitions,
				const TransitionSet& t1,
				const TransitionSet& t2) {
  /*
   * Case 1: transitions in both sets.
   */
  DdNode* dda = Cudd_bddAnd(dd_man, t1.condition_bdd(), t2.condition_bdd());
  Cudd_Ref(dda);
  if (dda != Cudd_ReadLogicZero(dd_man)) {
    DdNode* dde = Cudd_bddAnd(dd_man, t1.effect_bdd(), t2.effect_bdd());
    Cudd_Ref(dde);
    TransitionSet* t = new TransitionSet(dda, dde, t1.reward() + t2.reward(),
					 t1.touched_variables());
    t->touched_variables().insert(t2.touched_variables().begin(),
				  t2.touched_variables().end());
    transitions.push_back(t);
  } else {
    Cudd_RecursiveDeref(dd_man, dda);
  }
  /*
   * Case 2: transitions only in the first set.  Ignore this case if
   * the first transition set is a null transition set.
   */
  if (!t1.is_null()) {
    DdNode* dd2 = Cudd_Not(t2.condition_bdd());
    Cudd_Ref(dd2);
    dda = Cudd_bddAnd(dd_man, t1.condition_bdd(), dd2);
    Cudd_Ref(dda);
    Cudd_RecursiveDeref(dd_man, dd2);
    if (dda != Cudd_ReadLogicZero(dd_man)) {
      DdNode* dde = t1.effect_bdd();
      Cudd_Ref(dde);
      TransitionSet* t = new TransitionSet(dda, dde, t1.reward(),
					   t1.touched_variables());
      transitions.push_back(t);
    } else {
      Cudd_RecursiveDeref(dd_man, dda);
    }
  }
  /*
   * Case 3: transition only in the second set.  Ignore this case if
   * the second transition set is a null transition set.
   */
  if (!t2.is_null()) {
    DdNode* dd1 = Cudd_Not(t1.condition_bdd());
    Cudd_Ref(dd1);
    dda = Cudd_bddAnd(dd_man, dd1, t2.condition_bdd());
    Cudd_Ref(dda);
    Cudd_RecursiveDeref(dd_man, dd1);
    if (dda != Cudd_ReadLogicZero(dd_man)) {
      DdNode* dde = t2.effect_bdd();
      Cudd_Ref(dde);
      TransitionSet* t = new TransitionSet(dda, dde, t2.reward(),
					   t2.touched_variables());
      transitions.push_back(t);
    } else {
      Cudd_RecursiveDeref(dd_man, dda);
    }
  }
}


/* Constructs a null transition set. */
TransitionSet::TransitionSet()
  : condition_bdd_(Cudd_ReadOne(dd_man)), reward_(0) {
  Cudd_Ref(condition_bdd_);
  effect_bdd_ = Cudd_ReadOne(dd_man);
  Cudd_Ref(effect_bdd_);
}


/* Constructs a copy of the give transition set. */
TransitionSet::TransitionSet(const TransitionSet& t)
  : condition_bdd_(t.condition_bdd_), effect_bdd_(t.effect_bdd_),
    reward_(t.reward_), touched_variables_(t.touched_variables_) {
  Cudd_Ref(condition_bdd_);
  Cudd_Ref(effect_bdd_);
}


/* Constructs a transition set for a simple effect. */
TransitionSet::TransitionSet(DdNode* condition_bdd,
			     const Atom& atom, bool is_true)
  : condition_bdd_(condition_bdd), reward_(0) {
  Cudd_Ref(condition_bdd_);
  int i = state_variables[&atom];
  DdNode* ddv = Cudd_bddIthVar(dd_man, 2*i + 1);
  Cudd_Ref(ddv);
  if (is_true) {
    effect_bdd_ = ddv;
  } else {
    effect_bdd_ = Cudd_Not(ddv);
    Cudd_Ref(effect_bdd_);
    Cudd_RecursiveDeref(dd_man, ddv);
  }
  touched_variables_.insert(i);
}


/* Constructs a transition set for a reward effect. */
TransitionSet::TransitionSet(DdNode* condition_bdd, const Rational& reward)
  : condition_bdd_(condition_bdd), reward_(reward) {
  Cudd_Ref(condition_bdd_);
  effect_bdd_ = Cudd_ReadOne(dd_man);
  Cudd_Ref(effect_bdd_);
}


/* Deletes this transition set. */
TransitionSet::~TransitionSet() {
  Cudd_RecursiveDeref(dd_man, condition_bdd_);
  Cudd_RecursiveDeref(dd_man, effect_bdd_);
}


/* ====================================================================== */
/* OutcomeSet */

/*
 * Collection of probability weighted transition sets.
 */
struct OutcomeSet {
  std::vector<Rational> probabilities;
  std::vector<TransitionSetList> transitions;
};


/*
 * Deletes the given outcome set.
 */
static void free_outcomes(const OutcomeSet& outcomes) {
  for (std::vector<TransitionSetList>::const_iterator ei =
	 outcomes.transitions.begin();
       ei != outcomes.transitions.end(); ei++) {
    for (TransitionSetList::const_iterator ti = (*ei).begin();
	 ti != (*ei).end(); ti++) {
      delete *ti;
    }
  }
}


/*
 * Prints the given outcome set on the given stream.
 */
static void print_outcomes(std::ostream& os, const OutcomeSet& outcomes) {
  size_t n = outcomes.probabilities.size();
  for (size_t i = 0; i < n; i++) {
    os << "outcome " << i << ": " << outcomes.probabilities[i] << std::endl;
    for (TransitionSetList::const_iterator ti =
	   outcomes.transitions[i].begin();
	 ti != outcomes.transitions[i].end(); ti++) {
      os << "condition " << ti - outcomes.transitions[i].begin() << ':'
	 << std::endl;
      Cudd_PrintDebug(dd_man, (*ti)->condition_bdd(), 2*nvars, 2);
      os << "effect:" << std::endl;
      Cudd_PrintDebug(dd_man, (*ti)->effect_bdd(), 2*nvars, 2);
      os << "reward: " << (*ti)->reward() << std::endl;
      os << "touched variables:";
      for (std::set<int>::const_iterator vi =
	     (*ti)->touched_variables().begin();
	   vi != (*ti)->touched_variables().end(); vi++) {
	os << ' ' << *vi;
      }
      os << std::endl;
    }
  }
}


/*
 * Combines the given outcome sets, modifying the first set to make it
 * the combined outcome set.
 */
void combine_outcomes(OutcomeSet& outcomes1, const OutcomeSet& outcomes2) {
  size_t n = outcomes1.probabilities.size();
  size_t m = outcomes2.probabilities.size();
  for (size_t j = 1; j < m; j++) {
    const Rational& pj = outcomes2.probabilities[j];
    for (size_t i = 0; i < n; i++) {
      outcomes1.probabilities.push_back(outcomes1.probabilities[i]*pj);
      outcomes1.transitions.push_back(TransitionSetList());
      if (outcomes1.transitions[i].size() == 1
	  && outcomes1.transitions[i][0]->is_null()
	  && outcomes2.transitions[j].size() == 1
	  && outcomes2.transitions[j][0]->is_null()) {
	if (i + 1 == n) {
	  outcomes1.transitions.back().push_back(outcomes2.transitions[j][0]);
	} else {
	  outcomes1.transitions.back().push_back(new TransitionSet());
	}
      } else {
	for (TransitionSetList::const_iterator ti =
	       outcomes1.transitions[i].begin();
	     ti != outcomes1.transitions[i].end(); ti++) {
	  if (!(*ti)->is_null()) {
	    outcomes1.transitions.back().push_back(new TransitionSet(**ti));
	  }
	}
	for (TransitionSetList::const_iterator ti =
	       outcomes2.transitions[j].begin();
	     ti != outcomes2.transitions[j].end(); ti++) {
	  if (!(*ti)->is_null()) {
	    if (i + 1 == n) {
	      outcomes1.transitions.back().push_back(*ti);
	    } else {
	      outcomes1.transitions.back().push_back(new TransitionSet(**ti));
	    }
	  } else if (i + 1 == n) {
	    delete *ti;
	  }
	}
      }
    }
  }
  const Rational& p = outcomes2.probabilities[0];
  for (size_t i = 0; i < n; i++) {
    outcomes1.probabilities[i] = outcomes1.probabilities[i]*p;
    if (outcomes2.transitions[0].size() == 1
	&& outcomes2.transitions[0][0]->is_null()) {
      if (i + 1 == n) {
	delete outcomes2.transitions[0][0];
      }
    } else {
      if (outcomes1.transitions[i].size() == 1
	  && outcomes1.transitions[i][0]->is_null()) {
	delete outcomes1.transitions[i][0];
	outcomes1.transitions[i].clear();
      }
      if (i + 1 == n) {
	copy(outcomes2.transitions[0].begin(),
	     outcomes2.transitions[0].end(),
	     back_inserter(outcomes1.transitions[i]));
      } else {
	for (TransitionSetList::const_iterator ti =
	       outcomes2.transitions[0].begin();
	     ti != outcomes2.transitions[0].end(); ti++) {
	  if (!(*ti)->is_null()) {
	    outcomes1.transitions[i].push_back(new TransitionSet(**ti));
	  }
	}
      }
    }
  }
}


/*
 * Collects outcomes for the given effect.
 */
static void effect_outcomes(OutcomeSet& outcomes,
			    DdNode* condition_bdd, const Effect& effect) {
  if (condition_bdd == Cudd_ReadLogicZero(dd_man)) {
    /*
     * The condition is false, so no new outcomes are added.
     */
    return;
  }

  const AssignmentEffect* fe = dynamic_cast<const AssignmentEffect*>(&effect);
  if (fe != NULL) {
    /*
     * Only reward assignments are supported.  Add an outcome with
     * probability 1 for the reward assigned by this effect.
     */
    const Application& application = fe->assignment().application();
    if (application.function() != reward_function) {
      throw std::logic_error("numeric state variables not supported");
    }
    ValueMap values;
    values[&application] = 0;
    fe->assignment().affect(values);
    outcomes.probabilities.push_back(1);
    outcomes.transitions.push_back(TransitionSetList());
    const TransitionSet* t = new TransitionSet(condition_bdd,
					       values[&application]);
    outcomes.transitions.back().push_back(t);
    return;
  }

  const SimpleEffect* se = dynamic_cast<const SimpleEffect*>(&effect);
  if (se != NULL) {
    /*
     * Add an outcome with probability 1 and a single transition for
     * the simple effect.
     */
    bool is_true = typeid(*se) == typeid(AddEffect);
    outcomes.probabilities.push_back(1);
    outcomes.transitions.push_back(TransitionSetList());
    const TransitionSet* t = new TransitionSet(condition_bdd,
					       se->atom(), is_true);
    outcomes.transitions.back().push_back(t);
    return;
  }

  const ConjunctiveEffect* ce =
    dynamic_cast<const ConjunctiveEffect*>(&effect);
  if (ce != NULL) {
    /*
     * Collect the outcomes for the conjuncts.  All combinations of
     * these outcomes are the outcomes for the conjunctive effect.
     */
    size_t n = ce->size();
    if (n > 0) {
      effect_outcomes(outcomes, condition_bdd, ce->conjunct(0));
      for (size_t i = 1; i < n; i++) {
	OutcomeSet c_outcomes;
	effect_outcomes(c_outcomes, condition_bdd, ce->conjunct(i));
	combine_outcomes(outcomes, c_outcomes);
      }
    } else {
      outcomes.probabilities.push_back(1);
      outcomes.transitions.push_back(TransitionSetList());
      const TransitionSet* t = new TransitionSet(condition_bdd, 0);
      outcomes.transitions.back().push_back(t);
    }
    return;
  }

  const ConditionalEffect* we =
    dynamic_cast<const ConditionalEffect*>(&effect);
  if (we != NULL) {
    /*
     * Take the conjunction of the condition for this effect and the
     * condition inherited from nesting.  Make this the condition for
     * the outcomes of the effect.
     */
    DdNode* ddf = formula_bdd(we->condition());
    DdNode* ddc = Cudd_bddAnd(dd_man, condition_bdd, ddf);
    Cudd_Ref(ddc);
    Cudd_RecursiveDeref(dd_man, ddf);
    effect_outcomes(outcomes, ddc, we->effect());
    Cudd_RecursiveDeref(dd_man, ddc);
    return;
  }

  const ProbabilisticEffect* pe =
    dynamic_cast<const ProbabilisticEffect*>(&effect);
  if (pe != NULL) {
    /*
     * Add the outcomes of this probabilistic effect.
     */
    Rational p_rest = 1;
    size_t n = pe->size();
    for (size_t i = 0; i < n; i++) {
      Rational p = pe->probability(i);
      p_rest = p_rest - p;
      OutcomeSet p_outcomes;
      effect_outcomes(p_outcomes, condition_bdd, pe->effect(i));
      for (std::vector<Rational>::const_iterator pi =
	     p_outcomes.probabilities.begin();
	   pi != p_outcomes.probabilities.end(); pi++) {
	outcomes.probabilities.push_back(p*(*pi));
      }
      copy(p_outcomes.transitions.begin(), p_outcomes.transitions.end(),
	   back_inserter(outcomes.transitions));
    }
    if (p_rest > 0) {
      /*
       * Add an outcome with a null transition set, weighted by the
       * remaining probability.
       */
      outcomes.probabilities.push_back(p_rest);
      outcomes.transitions.push_back(TransitionSetList());
      outcomes.transitions.back().push_back(new TransitionSet());
    }
    return;
  }

  /*
   * No other types of effects exist.
   */
  throw std::logic_error("unexpected effect");
}


/* ====================================================================== */
/* ensure_mutex */

/*
 * Ensures that all transition set conditions are mutually exclusive
 * for each probabilistic outcome.
 */
static void ensure_mutex(OutcomeSet& outcomes) {
  size_t n = outcomes.probabilities.size();
  for (size_t i = 0; i < n; i++) {
    size_t m = outcomes.transitions[i].size();
    for (size_t j = 0; j < m - 1; j++) {
      for (size_t k = j + 1; k < m; k++) {
	const TransitionSet* t1 = outcomes.transitions[i][j];
	const TransitionSet* t2 = outcomes.transitions[i][k];
	DdNode* dda = Cudd_bddAnd(dd_man, t1->condition_bdd(),
				  t2->condition_bdd());
	Cudd_Ref(dda);
	if (dda != Cudd_ReadLogicZero(dd_man)) {
	  /*
	   * Transition sets j and k do not have mutually exclusive
	   * conditions, so split them into transition sets that have.
	   *
	   * Case 1: both transition set conditions are enabled.
	   */
	  DdNode* dde = Cudd_bddAnd(dd_man, t1->effect_bdd(),
				    t2->effect_bdd());
	  Cudd_Ref(dde);
	  TransitionSet* t = new TransitionSet(dda, dde,
					       t1->reward() + t2->reward(),
					       t1->touched_variables());
	  t->touched_variables().insert(t2->touched_variables().begin(),
					t2->touched_variables().end());
	  /* Replace transition set j with the new transition set. */
	  outcomes.transitions[i][j] = t;

	  /*
	   * Case 2: only condition for transition set j is enabled.
	   */
	  DdNode* dd2 = Cudd_Not(t2->condition_bdd());
	  Cudd_Ref(dd2);
	  dda = Cudd_bddAnd(dd_man, t1->condition_bdd(), dd2);
	  Cudd_Ref(dda);
	  Cudd_RecursiveDeref(dd_man, dd2);
	  if (dda != Cudd_ReadLogicZero(dd_man)) {
	    dde = t1->effect_bdd();
	    Cudd_Ref(dde);
	    TransitionSet* t = new TransitionSet(dda, dde, t1->reward(),
						 t1->touched_variables());
	    /* Add new transition set. */
	    outcomes.transitions[i].push_back(t);
	  } else {
	    Cudd_RecursiveDeref(dd_man, dda);
	  }

	  /*
	   * Case 3: only condition for transition set k is enabled.
	   */
	  DdNode* dd1 = Cudd_Not(t1->condition_bdd());
	  Cudd_Ref(dd1);
	  dda = Cudd_bddAnd(dd_man, dd1, t2->condition_bdd());
	  Cudd_Ref(dda);
	  Cudd_RecursiveDeref(dd_man, dd1);
	  if (dda != Cudd_ReadLogicZero(dd_man)) {
	    dde = t2->effect_bdd();
	    Cudd_Ref(dde);
	    TransitionSet* t = new TransitionSet(dda, dde, t2->reward(),
						 t2->touched_variables());
	    /* Add new transition set. */
	    outcomes.transitions[i].push_back(t);
	  } else {
	    Cudd_RecursiveDeref(dd_man, dda);
	  }

	  /*
	   * Remove transition set k.
	   */
	  outcomes.transitions[i][k] = outcomes.transitions[i].back();
	  k--;
	  outcomes.transitions[i].pop_back();
	  m = outcomes.transitions[i].size();
	  delete t1;
	  delete t2;
	} else {
	  Cudd_RecursiveDeref(dd_man, dda);
	}
      }
    }
  }
}


/* ====================================================================== */
/* matrix_to_dbn */

/* Constructs a DBN representation of the given transition probability
   matrix. */
static void matrix_to_dbn(DdNode* ddP) {
  DdNode* ddp = ddP;
  Cudd_Ref(ddp);
  DdNode** cube_vars = new DdNode*[nvars];
  for (int i = 0; i < nvars; i++) {
    cube_vars[i] = Cudd_addIthVar(dd_man, 2*i + 1);
    Cudd_Ref(cube_vars[i]);
  }
  /*
   * Construct a DBN from the joint probability distribution
   * (represented by the full transition probability matrix).  We have
   * chosen to process the variables in a fixed order, but a different
   * ordering could very well produce a more compact representation.
   *
   * The DBN for an action will contain synchronic arcs if the action
   * has correlated effects.
   */
  for (int i = nvars - 1; i >= 0; i--) {
    /*
     * Sum over `next-state' variables that have not yet been
     * processes.  This ensures an acyclic structure.
     */
    DdNode* ddc = Cudd_addComputeCube(dd_man, cube_vars, NULL, i);
    Cudd_Ref(ddc);
    DdNode* ddt = Cudd_addExistAbstract(dd_man, ddp, ddc);
    Cudd_Ref(ddt);
    Cudd_RecursiveDeref(dd_man, ddc);
    /*
     * We are only interested in cases where the current `next-state'
     * variable is true.  This is because we are trying to compute the
     * probability that the current `next-state' variable is true
     * conditioned on (possibly all) `current-state' variables and
     * unprocesses `next-state' variables.
     */
    DdNode* dds = Cudd_addApply(dd_man, Cudd_addTimes, cube_vars[i], ddt);
    Cudd_Ref(dds);
    /*
     * The above step ensures that the current `next-state' variable
     * is true, so we do not need to encode this in the MTBDD.
     */
    ddc = Cudd_addComputeCube(dd_man, &cube_vars[i], NULL, 1);
    Cudd_Ref(ddc);
    DdNode* ddm = Cudd_addExistAbstract(dd_man, dds, ddc);
    Cudd_Ref(ddm);
    Cudd_RecursiveDeref(dd_man, dds);
    Cudd_RecursiveDeref(dd_man, ddc);
    /*
     * At this point, ddm is an MTBDD representing the conditional
     * probability table for the current `next-state' variable being
     * true.
     */
    std::cout << "CPT for variable " << i << std::endl;
    Cudd_PrintDebug(dd_man, ddm, 2*nvars, 2);
    Cudd_RecursiveDeref(dd_man, ddm);
    /*
     * Factor the joint probability distribution before we continue
     * with the next variable.
     */
    dds = Cudd_addApply(dd_man, Cudd_addDivide, ddp, ddt);
    Cudd_Ref(dds);
    Cudd_RecursiveDeref(dd_man, ddp);
    Cudd_RecursiveDeref(dd_man, ddt);
    ddp = dds;
  }
  for (int i = 0; i < nvars; i++) {
    Cudd_RecursiveDeref(dd_man, cube_vars[i]);
  }
  Cudd_RecursiveDeref(dd_man, ddp);
}


/* ====================================================================== */
/* action_mtbdds */

/* Constructs MTBDDs representing the transition probability matrix and
   reward vector for the given action. */
static std::pair<DdNode*, DdNode*> action_mtbdds(const Action& action,
						 const Problem& problem,
						 DdNode* ddng,
						 DdNode* ddgp,
						 DdNode* col_cube) {
  /*
   * Collect probabilistic outcomes for the action, and make sure that
   * all transition sets for each outcome have mutually exclusive
   * conditions.
   */
  OutcomeSet outcomes;
  DdNode* ddf = formula_bdd(action.precondition());
  DdNode* ddc = Cudd_bddAnd(dd_man, ddf, ddng);
  Cudd_Ref(ddc);
  Cudd_RecursiveDeref(dd_man, ddf);
  effect_outcomes(outcomes, ddc, action.effect());
  ensure_mutex(outcomes);
  if (verbosity > 2) {
    std::cout << std::endl << "Outcomes for ";
    action.print(std::cout, problem.terms());
    std::cout << ':' << std::endl;
    print_outcomes(std::cout, outcomes);
  }

  /*
   * Construct MTBDD representations of the transition probability
   * matrix and transition reward matrix for the action.
   *
   * The transition probability matrix for an action is the sum of the
   * transition probability matrices of each probabilistic outcome.
   *
   * The transition reward matrix for an action is NOT simply the sum
   * of the transition reward matrices for each probabilistic outcome.
   * Each probabilistic outcome associates rewards with a set of state
   * transitions (a subset of all state transitions).  The reward for
   * a specific state transition must be the same for all
   * probabilistic outcomes that associate a reward with that state
   * transition.  An exception is thrown if the action defines
   * inconsistent transition rewards across probabilistic outcomes.
   * The reward for a state transition in the transition reward matrix
   * for the action is the reward defined by some probabilistic
   * outcome.
   */
  /* This is going to be the transition probability matrix. */
  DdNode* ddP = Cudd_ReadZero(dd_man);
  Cudd_Ref(ddP);
  /* This is going to be the transition reward matrix. */
  DdNode* ddR = Cudd_ReadZero(dd_man);
  Cudd_Ref(ddR);
  /* This is a BDD representing all transitions by any outcome, and is
     used to accurately compute the transition reward matrix. */
  DdNode* ddD = Cudd_ReadLogicZero(dd_man);
  Cudd_Ref(ddD);
  size_t n = outcomes.probabilities.size();
  for (size_t i = 0; i < n; i++) {
    /*
     * Construct MTBDD representations of the transition probability
     * and reward matrices for the ith probabilistic outcome.
     */
    /* This is going to be a BDD representing the state transitions
       defined by this outcome. */
    DdNode* ddT = Cudd_ReadLogicZero(dd_man);
    Cudd_Ref(ddT);
    /* This is going to be an MTBDD representing the transition reward
       matrix for this outcome. */
    DdNode* ddr;
    if (valid_reward_function) {
      ddr = Cudd_ReadZero(dd_man);
      Cudd_Ref(ddr);
    }
    /* This is going to be a BDD representing the conjunction of the
       negations of each individual transition set condition.  We need
       to add self-loops for all states satisfying this formula (this
       makes the transition set conditions not only mutually
       exclusive, but also exhaustive). */
    DdNode* ddN = Cudd_ReadOne(dd_man);
    Cudd_Ref(ddN);
    for (TransitionSetList::const_iterator ti =
	   outcomes.transitions[i].begin();
	 ti != outcomes.transitions[i].end(); ti++) {
      /*
       * Process an individual transition set.
       */
      const TransitionSet& t = **ti;
      if (t.effect_bdd() == Cudd_ReadLogicZero(dd_man)) {
	/*
	 * The effect of this transition set is inconsistent, meaning
	 * that the same atom is both added and deleted.
	 */
	throw std::logic_error("action `" + action.name()
			       + "' has inconsistent effects");
      }

      /*
       * The BDD representation of the transition matrix for a single
       * transition set is computed as the conjunction of the
       * condition BDD, the effect BDD, and the identity BDDs for each
       * untouched state variable.
       */
      DdNode* ddt = Cudd_ReadOne(dd_man);
      Cudd_Ref(ddt);
      /*
       * First account for untouched state variables.
       */
      for (int vi = nvars - 1; vi >= 0; vi--) {
	if (t.touched_variables().find(vi) == t.touched_variables().end()) {
	  DdNode* ddi = Cudd_bddAnd(dd_man, identity_bdds[vi], ddt);
	  Cudd_Ref(ddi);
	  Cudd_RecursiveDeref(dd_man, ddt);
	  ddt = ddi;
	}
      }
      /*
       * Next, the effect.
       */
      DdNode* dda = Cudd_bddAnd(dd_man, t.effect_bdd(), ddt);
      Cudd_Ref(dda);
      Cudd_RecursiveDeref(dd_man, ddt);
      ddt = dda;
      /*
       * Finally, the condition.
       */
      dda = Cudd_bddAnd(dd_man, t.condition_bdd(), ddt);
      Cudd_Ref(dda);
      Cudd_RecursiveDeref(dd_man, ddt);
      ddt = dda;

      /*
       * Add the transition matrix for the current transition set to
       * the transition matrix for the outcome.
       */
      DdNode* ddo = Cudd_bddOr(dd_man, ddt, ddT);
      Cudd_Ref(ddo);
      Cudd_RecursiveDeref(dd_man, ddT);
      ddT = ddo;

      /*
       * Add the reward for this transition set to the transition
       * reward matrix for the outcome.
       */
      if (valid_reward_function && t.reward() != 0) {
	DdNode* dds = Cudd_BddToAdd(dd_man, ddt);
	Cudd_Ref(dds);
	DdNode* ddv = Cudd_addConst(dd_man, t.reward().double_value());
	Cudd_Ref(ddv);
	dda = Cudd_addApply(dd_man, Cudd_addTimes, dds, ddv);
	Cudd_Ref(dda);
	Cudd_RecursiveDeref(dd_man, dds);
	Cudd_RecursiveDeref(dd_man, ddv);
	ddo = Cudd_addApply(dd_man, Cudd_addPlus, dda, ddr);
	Cudd_Ref(ddo);
	Cudd_RecursiveDeref(dd_man, dda);
	Cudd_RecursiveDeref(dd_man, ddr);
	ddr = ddo;
      }
      Cudd_RecursiveDeref(dd_man, ddt);

      /*
       * Remove the condition for the current transition set from the
       * condition representing uncovered states.
       */
      DdNode* ddn = Cudd_Not(t.condition_bdd());
      Cudd_Ref(ddn);
      dda = Cudd_bddAnd(dd_man, ddn, ddN);
      Cudd_Ref(dda);
      Cudd_RecursiveDeref(dd_man, ddn);
      Cudd_RecursiveDeref(dd_man, ddN);
      ddN = dda;
    }

    /*
     * Add self-loops for all states not covered by any transition set
     * conditions.
     */
    DdNode* dda;
    dda = Cudd_bddAnd(dd_man, ddc, ddN);
    Cudd_Ref(dda);
    Cudd_RecursiveDeref(dd_man, ddN);
    if (dda != Cudd_ReadLogicZero(dd_man)) {
      ddN = dda;
      dda = Cudd_bddAnd(dd_man, ddN, identity_bdd);
      Cudd_Ref(dda);
      Cudd_RecursiveDeref(dd_man, ddN);
      ddN = dda;
      DdNode* ddo = Cudd_bddOr(dd_man, ddN, ddT);
      Cudd_Ref(ddo);
      Cudd_RecursiveDeref(dd_man, ddN);
      Cudd_RecursiveDeref(dd_man, ddT);
      ddT = ddo;
    } else {
      Cudd_RecursiveDeref(dd_man, dda);
    }

    /*
     * Multiply the transition matrix for the current outcome with the
     * probability of the outcome, and add the result to the
     * transition probability matrix for the action.
     */
    DdNode* ddp = Cudd_BddToAdd(dd_man, ddT);
    Cudd_Ref(ddp);
    DdNode* ddk = Cudd_addConst(dd_man,
				outcomes.probabilities[i].double_value());
    Cudd_Ref(ddk);
    DdNode* ddt = Cudd_addApply(dd_man, Cudd_addTimes, ddp, ddk);
    Cudd_Ref(ddt);
    Cudd_RecursiveDeref(dd_man, ddp);
    Cudd_RecursiveDeref(dd_man, ddk);
    ddp = Cudd_addApply(dd_man, Cudd_addPlus, ddt, ddP);
    Cudd_Ref(ddp);
    Cudd_RecursiveDeref(dd_man, ddt);
    Cudd_RecursiveDeref(dd_man, ddP);
    ddP = ddp;

    /*
     * Construct transition reward matrix from goal condition for goal
     * directed problems.
     */
    if (!valid_reward_function) {
      DdNode* dda = Cudd_bddAnd(dd_man, ddT, ddgp);
      Cudd_Ref(dda);
      ddr = Cudd_BddToAdd(dd_man, dda);
      Cudd_Ref(ddr);
      Cudd_RecursiveDeref(dd_man, dda);
    } else if (problem.goal_reward() != NULL) {
      Rational gr = problem.goal_reward()->expression().value(ValueMap());
      DdNode* ddgr = Cudd_bddAnd(dd_man, ddT, ddgp);
      Cudd_Ref(ddgr);
      dda = Cudd_BddToAdd(dd_man, ddgr);
      Cudd_Ref(dda);
      Cudd_RecursiveDeref(dd_man, ddgr);
      DdNode* ddk = Cudd_addConst(dd_man, gr.double_value());
      Cudd_Ref(ddk);
      ddgr = Cudd_addApply(dd_man, Cudd_addTimes, dda, ddk);
      Cudd_Ref(ddgr);
      Cudd_RecursiveDeref(dd_man, dda);
      Cudd_RecursiveDeref(dd_man, ddk);
      dda = Cudd_addApply(dd_man, Cudd_addPlus, ddgr, ddr);
      Cudd_Ref(dda);
      Cudd_RecursiveDeref(dd_man, ddgr);
      Cudd_RecursiveDeref(dd_man, ddr);
      ddr = dda;
    }

    /*
     * Find the transitions that are assigned reward by the current
     * outcome, and have also been assigned reward by previous
     * outcomes.  The rewards are not allowed to be different for the
     * same transition in different outcomes.
     */
    dda = Cudd_bddAnd(dd_man, ddT, ddD);
    Cudd_Ref(dda);
    DdNode* ddn = Cudd_Not(dda);
    Cudd_Ref(ddn);
    ddt = Cudd_BddToAdd(dd_man, dda);
    Cudd_Ref(ddt);
    Cudd_RecursiveDeref(dd_man, dda);
    DdNode* new_r = Cudd_addApply(dd_man, Cudd_addTimes, ddt, ddr);
    Cudd_Ref(new_r);
    DdNode* old_r = Cudd_addApply(dd_man, Cudd_addTimes, ddt, ddR);
    Cudd_Ref(old_r);
    Cudd_RecursiveDeref(dd_man, ddt);
    if (Cudd_EqualSupNorm(dd_man, new_r, old_r, 1e-10, 0) == 0) {
      /*
       * The current outcome assigns rewards to transitions in
       * conflict with reward assignments of previous outcomes.
       */
      throw std::logic_error("action `" + action.name()
			     + "' has inconsistent transition rewards");
    }
    Cudd_RecursiveDeref(dd_man, new_r);
    Cudd_RecursiveDeref(dd_man, old_r);

    /*
     * Find the transitions that are assigned reward by the current
     * outcome, but have not previously been assigned any reward.  Add
     * the reward for these transitions to the transition reward
     * matrix for the action.
     */
    dda = Cudd_bddAnd(dd_man, ddT, ddn);
    Cudd_Ref(dda);
    Cudd_RecursiveDeref(dd_man, ddn);
    ddt = Cudd_BddToAdd(dd_man, dda);
    Cudd_Ref(ddt);
    Cudd_RecursiveDeref(dd_man, dda);
    new_r = Cudd_addApply(dd_man, Cudd_addTimes, ddt, ddr);
    Cudd_Ref(new_r);
    Cudd_RecursiveDeref(dd_man, ddt);
    Cudd_RecursiveDeref(dd_man, ddr);
    ddr = Cudd_addApply(dd_man, Cudd_addPlus, new_r, ddR);
    Cudd_Ref(ddr);
    Cudd_RecursiveDeref(dd_man, new_r);
    Cudd_RecursiveDeref(dd_man, ddR);
    ddR = ddr;

    /*
     * Add the transitions of this outcome to the BDD representing all
     * transitions.
     */
    DdNode* ddo = Cudd_bddOr(dd_man, ddT, ddD);
    Cudd_Ref(ddo);
    Cudd_RecursiveDeref(dd_man, ddD);
    ddD = ddo;
    Cudd_RecursiveDeref(dd_man, ddT);
  }
  Cudd_RecursiveDeref(dd_man, ddD);
  free_outcomes(outcomes);
  if (verbosity > 2) {
    std::cout << std::endl << "Transition probability matrix for ";
    action.print(std::cout, problem.terms());
    std::cout << ':' << std::endl;
    Cudd_PrintDebug(dd_man, ddP, 2*nvars, 2);
  }
  Cudd_RecursiveDeref(dd_man, ddc);

  /*
   * Compute reward vector from the transition probability matrix
   * and transition reward matrix.
   */
  DdNode* tmp = Cudd_addApply(dd_man, Cudd_addTimes, ddP, ddR);
  Cudd_Ref(tmp);
  Cudd_RecursiveDeref(dd_man, ddR);
  ddR = Cudd_addExistAbstract(dd_man, tmp, col_cube);
  Cudd_Ref(ddR);
  Cudd_RecursiveDeref(dd_man, tmp);

  return std::make_pair(ddP, ddR);
}


/* ====================================================================== */
/* Value iteration. */

/*
 * Returns a policy for the current problem generated using value
 * iteration.
 */
static DdNode* value_iteration(const Problem& problem,
			       DdNode* ddng, DdNode* col_cube,
			       double gamma, double epsilon) {
  if (verbosity > 0) {
    std::cout << "Value iteration";
  }
  /*
   * Precompute variable permutations.
   */
  int* row_to_col = new int[2*nvars];
  int* col_to_row = new int[2*nvars];
  for (int i = 0; i < nvars; i++) {
    row_to_col[2*i] = 2*i + 1;
    row_to_col[2*i + 1] = 2*i + 1;
    col_to_row[2*i] = 2*i;
    col_to_row[2*i + 1] = 2*i;
  }

  /*
   * Construct action conditions, action value filters, and initial policy.
   */
  std::map<const Action*, DdNode*> filters;
  std::map<const Action*, DdNode*> policy;
  for (std::map<const Action*, DdNode*>::const_iterator ai =
	 action_transitions.begin();
       ai != action_transitions.end(); ai++) {
    DdNode* ddc = formula_bdd((*ai).first->precondition());
    DdNode* ddt = Cudd_bddAnd(dd_man, ddc, ddng);
    Cudd_Ref(ddt);
    Cudd_RecursiveDeref(dd_man, ddc);
    DdNode* ddn = Cudd_Not(ddt);
    Cudd_Ref(ddn);
    Cudd_RecursiveDeref(dd_man, ddt);
    ddc = Cudd_BddToAdd(dd_man, ddn);
    Cudd_Ref(ddc);
    Cudd_RecursiveDeref(dd_man, ddn);
    ddn = Cudd_ReadPlusInfinity(dd_man);
    Cudd_Ref(ddn);
    ddt = Cudd_addApply(dd_man, Cudd_addTimes, ddc, ddn);
    Cudd_Ref(ddt);
    Cudd_RecursiveDeref(dd_man, ddc);
    Cudd_RecursiveDeref(dd_man, ddn);
    filters.insert(std::make_pair((*ai).first, ddt));
    DdNode* ddp = Cudd_ReadLogicZero(dd_man);
    Cudd_Ref(ddp);
    policy.insert(std::make_pair((*ai).first, ddp));
  }

  /*
   * Iterate until value function converges.
   */
  DdNode* ddg = Cudd_addConst(dd_man, gamma);
  Cudd_Ref(ddg);
  DdNode* ddV = Cudd_ReadZero(dd_man);
  Cudd_Ref(ddV);
  if (verbosity > 1) {
    std::cout << std::endl << "V 0:" << std::endl;
    Cudd_PrintDebug(dd_man, ddV, 2*nvars, 2);
  }
  double tolerance = epsilon*(1.0 - gamma)/(2.0*gamma);
  bool done = false;
  size_t iters = 0;
  while (!done) {
    iters++;
    if (verbosity == 1) {
      if (iters % 1000 == 0) {
	std::cout << ':';
      } else if (iters % 100 == 0) {
	std::cout << '.';
      }
    }
    DdNode* ddVp = Cudd_addPermute(dd_man, ddV, row_to_col);
    Cudd_Ref(ddVp);
    DdNode* ddM = Cudd_ReadZero(dd_man);
    Cudd_Ref(ddM);
    for (std::map<const Action*, DdNode*>::const_iterator ai =
	   action_transitions.begin();
	 ai != action_transitions.end(); ai++) {
      DdNode* ddp = Cudd_addApply(dd_man, Cudd_addTimes, (*ai).second, ddVp);
      Cudd_Ref(ddp);
      DdNode* dds = Cudd_addExistAbstract(dd_man, ddp, col_cube);
      Cudd_Ref(dds);
      Cudd_RecursiveDeref(dd_man, ddp);
      ddp = Cudd_addApply(dd_man, Cudd_addTimes, ddg, dds);
      Cudd_Ref(ddp);
      Cudd_RecursiveDeref(dd_man, dds);
      dds = Cudd_addApply(dd_man, Cudd_addPlus,
			  action_rewards[(*ai).first], ddp);
      Cudd_Ref(dds);
      Cudd_RecursiveDeref(dd_man, ddp);
      ddp = Cudd_addPermute(dd_man, dds, col_to_row);
      Cudd_Ref(ddp);
      Cudd_RecursiveDeref(dd_man, dds);
      DdNode* ddf = Cudd_addApply(dd_man, Cudd_addMinus, ddp,
				  filters[(*ai).first]);
      Cudd_Ref(ddf);
      Cudd_RecursiveDeref(dd_man, ddp);
      ddp = ddf;
      if (verbosity > 2) {
	std::cout << std::endl << "value of action ";
	(*ai).first->print(std::cout, problem.terms());
	std::cout << ':' << std::endl;
	Cudd_PrintDebug(dd_man, ddp, 2*nvars, 2);
      }
      DdNode* ddm = Cudd_addApply(dd_man, Cudd_addMinus, ddp, ddM);
      Cudd_Ref(ddm);
      DdNode*& dde = policy[(*ai).first];
      Cudd_RecursiveDeref(dd_man, dde);
      dde = Cudd_addBddThreshold(dd_man, ddm, 0);
      Cudd_Ref(dde);
      Cudd_RecursiveDeref(dd_man, ddm);
      DdNode* ddn = Cudd_Not(dde);
      Cudd_Ref(ddn);
      if (ddn != Cudd_ReadOne(dd_man)) {
	for (std::map<const Action*, DdNode*>::const_iterator aj =
	       policy.begin();
	     (*aj).first != (*ai).first; aj++) {
	  DdNode*& ddj = policy[(*aj).first];
	  DdNode* dda = Cudd_bddAnd(dd_man, ddn, ddj);
	  Cudd_Ref(dda);
	  Cudd_RecursiveDeref(dd_man, ddj);
	  ddj = dda;
	}
      }
      Cudd_RecursiveDeref(dd_man, ddn);
      ddm = Cudd_addApply(dd_man, Cudd_addMaximum, ddp, ddM);
      Cudd_Ref(ddm);
      Cudd_RecursiveDeref(dd_man, ddM);
      ddM = ddm;
      if (verbosity > 2) {
	std::cout << "current max values:" << std::endl;
	Cudd_PrintDebug(dd_man, ddM, 2*nvars, 2);
      }
      Cudd_RecursiveDeref(dd_man, ddp);
    }
    Cudd_RecursiveDeref(dd_man, ddVp);
    ddVp = ddM;
    if (verbosity > 1) {
      std::cout << "V " << iters << ':' << std::endl;
      Cudd_PrintDebug(dd_man, ddVp, 2*nvars, 2);
    }
    done = (Cudd_EqualSupNorm(dd_man, ddV, ddVp, tolerance, 0) == 1);
    Cudd_RecursiveDeref(dd_man, ddV);
    ddV = ddVp;
  }
  if (verbosity == 1) {
    std::cout << ' ' << iters << " iterations." << std::endl;
  }
  Cudd_RecursiveDeref(dd_man, ddV);
  Cudd_RecursiveDeref(dd_man, ddg);
  for (std::map<const Action*, DdNode*>::const_iterator ai = filters.begin();
       ai != filters.end(); ai++) {
    Cudd_RecursiveDeref(dd_man, (*ai).second);
  }
  delete row_to_col;
  delete col_to_row;

  /*
   * Construct single policy MTBDD.
   */
  DdNode* ddP = Cudd_ReadZero(dd_man);
  Cudd_Ref(ddP);
  for (std::map<const Action*, DdNode*>::const_iterator ai = policy.begin();
       ai != policy.end(); ai++) {
    if ((*ai).second != Cudd_ReadLogicZero(dd_man)) {
      policy_actions.insert(std::make_pair((*ai).first->id(), (*ai).first));
    }
    DdNode* ddp = Cudd_BddToAdd(dd_man, (*ai).second);
    Cudd_Ref(ddp);
    Cudd_RecursiveDeref(dd_man, (*ai).second);
    size_t id = (*ai).first->id();
    DdNode* ddi = Cudd_addConst(dd_man, id);
    Cudd_Ref(ddi);
    DdNode* ddt = Cudd_addApply(dd_man, Cudd_addTimes, ddi, ddp);
    Cudd_Ref(ddt);
    Cudd_RecursiveDeref(dd_man, ddi);
    Cudd_RecursiveDeref(dd_man, ddp);
    ddp = Cudd_addApply(dd_man, Cudd_addPlus, ddt, ddP);
    Cudd_Ref(ddp);
    Cudd_RecursiveDeref(dd_man, ddt);
    Cudd_RecursiveDeref(dd_man, ddP);
    ddP = ddp;
  }
  return ddP;
}


/* ====================================================================== */
/* solve_problem */

/* Solves the given problem. */
static DdNode* solve_problem(const Problem& problem,
			     double gamma, double epsilon) {
  /*
   * Extract the reward function.
   */
  std::pair<Function, bool> rf =
    problem.domain().functions().find_function("reward");
  if (rf.second) {
    reward_function = rf.first;
  } else {
    reward_function = problem.domain().functions().last_function() + 1;
  }
  valid_reward_function = rf.second;

  /*
   * Collect state variables and assign indices to them.
   */
  for (ActionList::const_iterator ai = problem.actions().begin();
       ai != problem.actions().end(); ai++) {
    const Action& action = **ai;
    collect_state_variables(action.precondition());
    collect_state_variables(action.effect());
  }
  for (EffectList::const_iterator ei = problem.init_effects().begin();
       ei != problem.init_effects().end(); ei++) {
    collect_state_variables(**ei);
  }
  nvars = state_variables.size();
  if (verbosity > 0) {
    std::cout << std::endl << "Number of state variables: " << nvars
	      << std::endl;
    if (verbosity > 1) {
      for (std::map<int, const Atom*>::const_iterator vi =
	     dynamic_atoms.begin();
	   vi != dynamic_atoms.end(); vi++) {
	std::cout << (*vi).first << '\t';
	(*vi).second->print(std::cout, problem.domain().predicates(),
			    problem.domain().functions(), problem.terms());
	std::cout << std::endl;
      }
    }
  }

  /*
   * Initialize CUDD.
   */
  dd_man = Cudd_Init(2*nvars, 0, CUDD_UNIQUE_SLOTS, CUDD_CACHE_SLOTS, 0);

  /*
   * Collect column variables and compute their cube.
   */
  DdNode** col_variables = new DdNode*[nvars];
  for (int i = 0; i < nvars; i++) {
    col_variables[i] = Cudd_addIthVar(dd_man, 2*i + 1);
    Cudd_Ref(col_variables[i]);
  }
  DdNode* col_cube = Cudd_addComputeCube(dd_man, col_variables, NULL, nvars);
  Cudd_Ref(col_cube);
  for (int i = 0; i < nvars; i++) {
    Cudd_RecursiveDeref(dd_man, col_variables[i]);
  }
  delete col_variables;

  /*
   * Construct identity BDDs for state variables.
   */
  DdNode** row_vars = new DdNode*[nvars];
  DdNode** col_vars = new DdNode*[nvars];
  for (int i = 0; i < nvars; i++) {
    DdNode* x = Cudd_bddIthVar(dd_man, 2*i);
    DdNode* y = Cudd_bddIthVar(dd_man, 2*i + 1);
    identity_bdds.push_back(Cudd_Xeqy(dd_man, 1, &x, &y));
    Cudd_Ref(identity_bdds.back());
    row_vars[i] = x;
    col_vars[i] = y;
  }
  identity_bdd = Cudd_Xeqy(dd_man, nvars, row_vars, col_vars);
  Cudd_Ref(identity_bdd);
  delete row_vars;
  delete col_vars;

  /*
   * Construct a BDDs representing goal states.
   */
  DdNode* ddg = formula_bdd(problem.goal());
  if (verbosity > 1) {
    std::cout << std::endl << "Goal state BDD:" << std::endl;
    Cudd_PrintDebug(dd_man, ddg, 2*nvars, 2);
  }
  int* row_to_col = new int[2*nvars];
  for (int i = 0; i < nvars; i++) {
    row_to_col[2*i] = 2*i + 1;
    row_to_col[2*i + 1] = 2*i + 1;
  }
  DdNode* ddgp = Cudd_bddPermute(dd_man, ddg, row_to_col);
  Cudd_Ref(ddgp);
  delete row_to_col;

  /*
   * Construct transition probability and reward MTBDDs for actions.
   */
  DdNode* ddng = Cudd_Not(ddg);
  Cudd_Ref(ddng);
  Cudd_RecursiveDeref(dd_man, ddg);
  for (ActionList::const_iterator ai = problem.actions().begin();
       ai != problem.actions().end(); ai++) {
    const Action& action = **ai;
    std::pair<DdNode*, DdNode*> dds = action_mtbdds(action, problem, ddng,
						    ddgp, col_cube);
    action_transitions.insert(std::make_pair(&action, dds.first));
    action_rewards.insert(std::make_pair(&action, dds.second));
  }
  Cudd_RecursiveDeref(dd_man, ddgp);
  for (std::vector<DdNode*>::const_iterator di = identity_bdds.begin();
       di != identity_bdds.end(); di++) {
    Cudd_RecursiveDeref(dd_man, *di);
  }
  identity_bdds.clear();
  Cudd_RecursiveDeref(dd_man, identity_bdd);
  if (verbosity > 1) {
    for (std::map<const Action*, DdNode*>::iterator ai =
	   action_transitions.begin();
	 ai != action_transitions.end(); ai++) {
      std::cout << std::endl << "Transition probability matrix for ";
      (*ai).first->print(std::cout, problem.terms());
      std::cout << ':' << std::endl;
      Cudd_PrintDebug(dd_man, (*ai).second, 2*nvars, 2);
#if 0
      matrix_to_dbn((*ai).second);
#endif
      std::cout << "Reward vector for ";
      (*ai).first->print(std::cout, problem.terms());
      std::cout << ':' << std::endl;
      Cudd_PrintDebug(dd_man, action_rewards[(*ai).first], 2*nvars, 2);
    }
  }

  DdNode* ddP = value_iteration(problem, ddng, col_cube, gamma, epsilon);
  Cudd_RecursiveDeref(dd_man, ddng);
  if (verbosity > 0) {
    std::cout << std::endl << "Policy:" << std::endl;
    Cudd_PrintDebug(dd_man, ddP, 2*nvars, 2);
  }

  /*
   * Clean up.
   */
  state_variables.clear();
  Cudd_RecursiveDeref(dd_man, col_cube);
  for (std::map<const Action*, DdNode*>::const_iterator ai =
	 action_transitions.begin();
       ai != action_transitions.end(); ai++) {
    Cudd_RecursiveDeref(dd_man, (*ai).second);
  }
  action_transitions.clear();
  for (std::map<const Action*, DdNode*>::const_iterator ai =
	 action_rewards.begin();
       ai != action_rewards.end(); ai++) {
    Cudd_RecursiveDeref(dd_man, (*ai).second);
  }
  action_rewards.clear();

  return ddP;
}


/* ====================================================================== */
/* MTBDDPlanner */

/* Deletes this MTBDD planner. */
MTBDDPlanner::~MTBDDPlanner() {
  if (mapping_ != NULL) {
    Cudd_RecursiveDeref(dd_man_, mapping_);
    Cudd_DebugCheck(dd_man_);
    int unrel = Cudd_CheckZeroRef(dd_man_);
    if (unrel != 0) {
      std::cerr << unrel << " unreleased DDs" << std::endl;
    }
    Cudd_Quit(dd_man_);
  }
}  


void MTBDDPlanner::initRound() {
  if (mapping_ == NULL) {
    mapping_ = solve_problem(_problem, gamma_, epsilon_);
    dd_man_ = dd_man;
    actions_ = policy_actions;
    policy_actions.clear();
    dynamic_atoms_ = dynamic_atoms;
    dynamic_atoms.clear();
  }
}


const Action* MTBDDPlanner::decideAction(const State& state) {
  DdNode* dds = state_bdd(dd_man_, dynamic_atoms_, state.atoms());
  DdNode* ddS = Cudd_BddToAdd(dd_man_, dds);
  Cudd_Ref(ddS);
  Cudd_RecursiveDeref(dd_man_, dds);
  DdNode* dda = Cudd_addEvalConst(dd_man_, ddS, mapping_);
  Cudd_Ref(dda);
  Cudd_RecursiveDeref(dd_man_, ddS);
  size_t id = int(Cudd_V(dda) + 0.5);
  Cudd_RecursiveDeref(dd_man_, dda);
  std::map<size_t, const Action*>::const_iterator ai = actions_.find(id);
  return (ai != actions_.end()) ? (*ai).second : NULL;
}


void MTBDDPlanner::endRound() {
}
