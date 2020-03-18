/*
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
 * $Id: client.cc,v 1.4 2004/03/10 23:00:59 john Exp $
 */
#include <assert.h>
#include "strxml.h"
#include "client.h"

int sessionRequestInfo(XMLNodePtr node, int& rounds, float& time, int& turns)
{
  XMLNodePtr settingNode = node->getChild("setting");
  if (!settingNode)
    return 0;

  std::string s;
  if (!dissectNode(settingNode, "rounds", s))
    return 0;
  rounds = atoi(s.c_str());

  if (!dissectNode(settingNode, "allowed-time", s))
    return 0;
  time = atof(s.c_str());

  if (!dissectNode(settingNode, "allowed-turns", s))
    return 0;
  turns = atoi(s.c_str());

  return 1;
}

XMLClient::XMLClient(Planner* planner, const Problem* pr, std::string name,
		     std::istream& is, std::ostream& os)
{
  _problem = pr;
  _planner = planner;

  os << "<session-request>"
     <<  "<name>" << name << "</name>"
     <<  "<problem>" << _problem->name() << "</problem>"
     << "</session-request>" << std::endl;
  
  XMLNodePtr sessionInitNode = 0;
  is >> sessionInitNode;

  if (!sessionRequestInfo(sessionInitNode, total_rounds, round_time, round_turns)) {
    std::cerr << "Error in server's session-request response" << std::endl;
    return;
  }

  delete sessionInitNode;

  rounds_left = total_rounds;
  
  while (rounds_left) {
    rounds_left--;
    os << "<round-request/>" << std::endl;
    XMLNodePtr roundInitNode = 0;
    is >> roundInitNode;
    if (!roundInitNode || roundInitNode->getName() != "round-init") {
      std::cerr << "Error in server's round-request response" << std::endl;
      delete roundInitNode;
      return;
    }

    delete roundInitNode;

    _planner->initRound();

    XMLNodePtr response = 0;
    while (1) {

      is >> response;

      if (!response) {
	std::cerr << "Invalid state response" << std::endl;
	return;
      }

      if (response->getName() == "end-round" || response->getName() == "end-session") {
	std::cout << response << std::endl;
	break;
      }

      const State *s = getState(response);

      if (!s) {
	std::cerr << "Invalid state response: " << response << std::endl;
	return;
      }

      if (!_planner) {
	std::cout << "null planner" << std::endl;
	return;
      }

      const Action *a = _planner->decideAction(*s);
      assert(a!=0);

      sendAction(os, a);
      delete s;
    }

    _planner->endRound();

    if (response && response->getName() == "end-session") {
      delete response;
      break;
    }
    delete response;
  }
  XMLNodePtr endSessionNode = 0;
  is >> endSessionNode;
  
  if (endSessionNode) {
    std::cout << endSessionNode << std::endl;
    delete endSessionNode;
  }  
}

const State* XMLClient::getState(XMLNodePtr stateNode)
{
  if (!stateNode)
    return 0;
  if (stateNode->getName() != "state")
    return 0;

  State *s = new State();
  
  for (int i=0; i<stateNode->size(); i++) {
    XMLNodePtr cn = stateNode->getChild(i);
    if (cn->getName() == "atom") {
      const Atom *a = getAtom(cn);
      if (a) {
	s->addAtom(*a);
      }
    }
    else if (cn->getName() == "fluent") {
      const Application *a = getApplication(cn);
      std::string value_str;
      if (!dissectNode(cn, "value", value_str))
	return 0;
      s->addValueEntry(*a, Rational(value_str.c_str()));
    }
  }
  
  return s;
}

const Application* XMLClient::getApplication(XMLNodePtr appNode)
{
  const Domain& domain = _problem->domain();

  if (!appNode || appNode->getName() != "fluent")
    return 0;

  // get function name

  std::string function_name;
  if (!dissectNode(appNode, "function", function_name))
    return 0;

  std::pair<Function, bool> p = domain.functions().find_function(function_name);
  if (!p.second)
    return 0;
  

  Function function = p.first;
  // get terms
  TermList terms;
  int argIndex = 0;
  for (int i = 0; i<appNode->size(); i++) {
    XMLNodePtr termNode = appNode->getChild(i);
    if (!termNode || termNode->getName() != "term")
      continue;
    argIndex++;

    Type correctType = domain.functions().parameter(function, argIndex);
    std::string term_name = termNode->getText();
    std::pair<Object, bool> o = _problem->terms().find_object(term_name);

    if (o.second) {
      if (_problem->terms().type(o.first) != correctType) {
	return 0;
      }
    }
    else {
      o = domain.terms().find_object(term_name);
      if (! o.second)
	return 0;
      else if (domain.terms().type(o.first) != correctType) {
	return 0;
      }
    }
    
    terms.push_back(o.first);
  }
  
  if (domain.functions().arity(function) != terms.size()) 
    return 0;
  
  const Application& a = Application::make_application(function,terms);
  return &a;
}

const Atom* XMLClient::getAtom(XMLNodePtr atomNode)
{
  const Domain& domain = _problem->domain();

  if (!atomNode || atomNode->getName() != "atom") {
    return 0;
  }

  // get predicate
  std::string predicate_name;
  if (!dissectNode(atomNode, "predicate", predicate_name)) {
    return 0;
  }
  std::pair<Predicate, bool> p = domain.predicates().find_predicate(predicate_name);
  if (!p.second) {
    return 0;
  }

  Predicate predicate = p.first;
  // get terms
  TermList terms;
  int argIndex = 0;
  for (int i=0; i<atomNode->size(); i++) {
    
    XMLNodePtr termNode = atomNode->getChild(i);
    if (!termNode || termNode->getName() != "term")
      continue;

    Type correctType = domain.predicates().parameter(predicate, argIndex);
    argIndex++;
    
    std::string term_name = termNode->getText();
    std::pair<Object, bool> o = _problem->terms().find_object(term_name);
    if (o.second) {
      if (!domain.types().subtype(_problem->terms().type(o.first), correctType)) {
	return 0;
      }
    }


    else {
      o = domain.terms().find_object(term_name);
      if (! o.second) {
	return 0;
      }
      else if (domain.terms().type(o.first) != correctType) {
	return 0;
      }
    }

    terms.push_back(o.first);
  }
  
  if (domain.predicates().arity(predicate) != terms.size()) {
    assert(0);
    return 0;
  }
  
  const Atom& a = Atom::make_atom(predicate,terms);
  return &a;
}

void XMLClient::sendAction(std::ostream& os, const Action *a)
{
  os << "<act>" << std::flush;
  a->printXML(os, _problem->terms());
  os << "</act>" << std::endl;
}

XMLClient::~XMLClient()
{

}

