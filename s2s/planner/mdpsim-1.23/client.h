/* -*-C++-*- */
/*
 * XML Clients.
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
 * $Id: client.h,v 1.1 2003/11/07 03:04:33 john Exp $
 */
#ifndef _CLIENT_H
#define _CLIENT_H

#include <iostream>

#include "states.h"
#include "problems.h"
#include "domains.h"
#include "exceptions.h"
#include "actions.h"

#include "strxml.h"

class Planner
{
 protected:
  const Problem& _problem;
 public:
  Planner(const Problem& problem) : _problem(problem) {}
  virtual void initRound() = 0;
  virtual const Action* decideAction(const State&) = 0;
  virtual void endRound() = 0;
};

class XMLClient
{
 private:
  const Problem *_problem;
  Planner *_planner;
  int total_rounds;
  int rounds_left;
  float round_time;
  int round_turns;
 public:
  XMLClient(Planner* planner, const Problem* problem, std::string name,
	    std::istream& is, std::ostream& os);
  const State* getState(XMLNodePtr stateNode);
  const Atom* getAtom(XMLNodePtr atomNode);
  const Application* getApplication(XMLNodePtr appNode);
  void sendAction(std::ostream& os, const Action *a);
  int doRound();
  
  ~XMLClient();
};

#endif
