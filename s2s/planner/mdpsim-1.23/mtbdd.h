/* -*-C++-*- */
#ifndef MTBDD_H
#define MTBDD_H

#include <config.h>
#include "client.h"
#include <cudd.h>
#include <util.h>


/* ====================================================================== */
/* MTBDDPlanner */

/*
 * An MTBDD planner.
 */
struct MTBDDPlanner : public Planner {
  /* Constructs an MTBDD planner. */
  MTBDDPlanner(const Problem& problem, double gamma, double epsilon)
    : Planner(problem), gamma_(gamma), epsilon_(epsilon), mapping_(NULL) {}

  /* Deletes this MTBDD planner. */
  virtual ~MTBDDPlanner();

  virtual void initRound();
  virtual const Action* decideAction(const State& state);
  virtual void endRound();

private:
  /* Discount factor. */
  double gamma_;
  /* Error tolerance. */
  double epsilon_;
  /* DD manager. */
  DdManager* dd_man_;
  /* Policy. */
  DdNode* mapping_;
  /* Actions. */
  std::map<size_t, const Action*> actions_;
  /* State variables. */
  std::map<int, const Atom*> dynamic_atoms_;
};


#endif /* MTBDD_H */
