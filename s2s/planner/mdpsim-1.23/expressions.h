/* -*-C++-*- */
/*
 * Expressions.
 *
 * Copyright (C) 2003 Carnegie Mellon University and Rutgers University
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
 * $Id: expressions.h,v 1.1 2003/11/07 03:04:33 john Exp $
 */
#ifndef EXPRESSIONS_H
#define EXPRESSIONS_H

#include <config.h>
#include "functions.h"
#include "terms.h"
#include "rational.h"
#include "hashing.h"
#include <iostream>
#include <set>

struct Problem;


/* ====================================================================== */
/* ValueMap */

struct Application;

/*
 * Mapping from function applications to values.
 */
struct ValueMap : public hashing::hash_map<const Application*, Rational> {
};


/* ====================================================================== */
/* Expression. */

/*
 * An abstract expression.
 */
struct Expression {
  /* Register use of the given expression. */
  static void register_use(const Expression* e) {
    if (e != NULL) {
      e->ref_count_++;
    }
  }

  /* Unregister use of the given expression. */
  static void unregister_use(const Expression* e) {
    if (e != NULL) {
      e->ref_count_--;
      if (e->ref_count_ == 0) {
	delete e;
      }
    }
  }

  /* Deletes this expression. */
  virtual ~Expression() {}

  /* Returns the value of this expression in the given state. */
  virtual Rational value(const ValueMap& values) const = 0;

  /* Returns an instantiation of this expression. */
  virtual const Expression& instantiation(const SubstitutionMap& subst,
					  const Problem& problem) const = 0;

  /* Prints this object on the given stream. */
  virtual void print(std::ostream& os, const FunctionTable& functions,
		     const TermTable& terms) const = 0;

protected:
  /* Constructs an expression. */
  Expression() : ref_count_(0) {}

private:
  /* Reference counter. */
  mutable size_t ref_count_;
};


/* ====================================================================== */
/* Value */

/*
 * A constant value.
 */
struct Value : public Expression {
  /* Constructs a constant value. */
  Value(const Rational& value) : value_(value) {}

  /* Returns the value of this expression. */
  const Rational& value() const { return value_; }

  /* Returns the value of this expression in the given state. */
  virtual Rational value(const ValueMap& values) const;

  /* Returns an instantiation of this expression. */
  virtual const Value& instantiation(const SubstitutionMap& subst,
				     const Problem& problem) const;

  /* Prints this object on the given stream. */
  virtual void print(std::ostream& os, const FunctionTable& functions,
		     const TermTable& terms) const;

private:
  /* The value. */
  Rational value_;
};


/* ====================================================================== */
/* Application */

/*
 * A function application.
 */
struct Application : public Expression {
  /* Returns a function application with the given function and terms. */
  static const Application& make_application(Function function,
					     const TermList& terms);

  /* Deletes this function application. */
  virtual ~Application();

  /* Returns the function of this function application. */
  Function function() const { return function_; }

  /* Returns the number of terms of this function application. */
  size_t arity() const { return terms_.size(); }

  /* Returns the ith term of this function application. */
  Term term(size_t i) const { return terms_[i]; }

  /* Returns the value of this expression in the given state. */
  virtual Rational value(const ValueMap& values) const;

  /* Returns this application subject to the given substitution. */
  const Application& substitution(const SubstitutionMap& subst) const;

  /* Returns an instantiation of this expression. */
  virtual const Expression& instantiation(const SubstitutionMap& subst,
					  const Problem& problem) const;

  /* Prints this object on the given stream. */
  virtual void print(std::ostream& os, const FunctionTable& functions,
		     const TermTable& terms) const;

  /* Prints this object on the given stream in XML. */
  void printXML(std::ostream& os, const FunctionTable& functions,
		const TermTable& terms) const;

private:
  /* Less-than comparison function object for function applications. */
  struct ApplicationLess
    : public std::binary_function<const Application*, const Application*,
				  bool> {
    /* Comparison function. */
    bool operator()(const Application* a1, const Application* a2) const;
  };

  /* A table of function applications. */
  struct ApplicationTable : std::set<const Application*, ApplicationLess> {
  };

  /* Table of function applications. */
  static ApplicationTable applications;

  /* Function of this function application. */
  Function function_;
  /* Terms of this function application. */
  TermList terms_;

  /* Constructs a function application with the given function. */
  Application(Function function) : function_(function) {}

  /* Adds a term to this function application. */
  void add_term(Term term) { terms_.push_back(term); }
};


/* ====================================================================== */
/* Addition */

/*
 * An addition.
 */
struct Addition : public Expression {
  /* Constructs an addition. */
  Addition(const Expression& term1, const Expression& term2);

  /* Deletes this addition. */
  virtual ~Addition();

  /* Returns the first term of this addition. */
  const Expression& term1() const { return *term1_; }

  /* Returns the second term of this addition. */
  const Expression& term2() const { return *term2_; }

  /* Returns the value of this expression in the given state. */
  virtual Rational value(const ValueMap& values) const;

  /* Returns an instantiation of this expression. */
  virtual const Expression& instantiation(const SubstitutionMap& subst,
					  const Problem& problem) const;

  /* Prints this object on the given stream. */
  virtual void print(std::ostream& os, const FunctionTable& functions,
		     const TermTable& terms) const;

private:
  /* The first term. */
  const Expression* term1_;
  /* The second term. */
  const Expression* term2_;
};


/* ====================================================================== */
/* Subtraction */

/*
 * A subtraction.
 */
struct Subtraction : public Expression {
  /* Constructs a subtraction. */
  Subtraction(const Expression& term1, const Expression& term2);

  /* Deletes this subtraction. */
  virtual ~Subtraction();

  /* Returns the first term of this subtraction. */
  const Expression& term1() const { return *term1_; }

  /* Returns the second term of this subtraction. */
  const Expression& term2() const { return *term2_; }

  /* Returns the value of this expression in the given state. */
  virtual Rational value(const ValueMap& values) const;

  /* Returns an instantiation of this expression. */
  virtual const Expression& instantiation(const SubstitutionMap& subst,
					  const Problem& problem) const;

  /* Prints this object on the given stream. */
  virtual void print(std::ostream& os, const FunctionTable& functions,
		     const TermTable& terms) const;

private:
  /* The first term. */
  const Expression* term1_;
  /* The second term. */
  const Expression* term2_;
};


/* ====================================================================== */
/* Multiplication */

/*
 * A multiplication.
 */
struct Multiplication : public Expression {
  /* Constructs a multiplication. */
  Multiplication(const Expression& factor1, const Expression& factor2);

  /* Deletes this multiplication. */
  virtual ~Multiplication();

  /* Returns the first factor of this multiplication. */
  const Expression& factor1() const { return *factor1_; }

  /* Returns the second factor of this multiplication. */
  const Expression& factor2() const { return *factor2_; }

  /* Returns the value of this expression in the given state. */
  virtual Rational value(const ValueMap& values) const;

  /* Returns an instantiation of this expression. */
  virtual const Expression& instantiation(const SubstitutionMap& subst,
					  const Problem& problem) const;

  /* Prints this object on the given stream. */
  virtual void print(std::ostream& os, const FunctionTable& functions,
		     const TermTable& terms) const;

private:
  /* The first factor. */
  const Expression* factor1_;
  /* The second factor. */
  const Expression* factor2_;
};


/* ====================================================================== */
/* Division */

/*
 * A division.
 */
struct Division : public Expression {
  /* Constructs a division. */
  Division(const Expression& factor1, const Expression& factor2);

  /* Deletes this division. */
  virtual ~Division();

  /* Returns the first factor of this division. */
  const Expression& factor1() const { return *factor1_; }

  /* Returns the second factor of this division. */
  const Expression& factor2() const { return *factor2_; }

  /* Returns the value of this expression in the given state. */
  virtual Rational value(const ValueMap& values) const;

  /* Returns an instantiation of this expression. */
  virtual const Expression& instantiation(const SubstitutionMap& subst,
					  const Problem& problem) const;

  /* Prints this object on the given stream. */
  virtual void print(std::ostream& os, const FunctionTable& functions,
		     const TermTable& terms) const;

private:
  /* The first factor. */
  const Expression* factor1_;
  /* The second factor. */
  const Expression* factor2_;
};


#endif /* EXPRESSIONS_H */
