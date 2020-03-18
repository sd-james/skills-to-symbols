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
 * $Id: mdpserver.cc,v 1.11 2004/04/29 00:28:31 hakan Exp $
 */

#include <config.h>
#include <iostream>
#include <fstream>
#include <cerrno>
#include <cstdio>
#include <ctime>
#if defined __GNUC__ && __GNUC__ >= 3
#include <ext/stdio_filebuf.h>
#endif
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>
#include <pthread.h>
#include <stdlib.h>
#include <string.h>
#include <stack>
#include <sys/time.h>

#include "states.h"
#include "problems.h"
#include "domains.h"
#include "exceptions.h"
#include "mdpserver.h"
#include "strxml.h"

#if !HAVE_SOCKLEN_T
# if !defined(__sgi) || defined(_NO_XOPEN4)
typedef int socklen_t;
# else
typedef size_t socklen_t;
# endif
#endif

extern std::string log_dir;

typedef std::pair<std::string, std::string> str_pair;
typedef std::pair<int, int> int_pair;
typedef std::vector<std::string> str_vec;

CFG_map config_map;

const Action* make_action(str_vec params, const Problem *problem)
{
  if (!problem) {
    return NULL;
  }

  std::string action_name = params[0];

  //find the action schema
  const ActionSchema *as = problem->domain().find_action(action_name);
  if (!as)
    return NULL;

  //create a list of objects with the names taken from params
  ObjectList objs;
  for (size_t i=0; i<as->arity(); i++) {
    std::string obj_name = params[i+1];
    std::pair<Object, bool> r = problem->terms().find_object(obj_name);
    if (!r.second)
      return NULL;
    objs.push_back(r.first);
  }
  
  SubstitutionMap args;
  std::stack<const StateFormula*> preconds;
  preconds.push(&as->precondition().instantiation(args,*problem)); // patch by`Blai Bonet
  StateFormula::register_use(preconds.top());
  for (size_t i=0; i<as->arity(); i++) {
    //construct the argument list from objs
    args.insert(std::make_pair(as->parameter(i), objs[i]));

    //make a one argument list
    SubstitutionMap pargs;
    pargs.insert(std::make_pair(as->parameter(i), objs[i]));

    //create the up to date precondition
    const StateFormula& precond = preconds.top()->instantiation(pargs, *problem);

    //push it on the stack, register 
    preconds.push(&precond);
    StateFormula::register_use(&precond);

    //if there is a contradiction at any point
    if (precond.contradiction()) {
      //unregister all preconditions
      while (!preconds.empty()) {
	StateFormula::unregister_use(preconds.top());
	preconds.pop();
      }
      
      return NULL;
    }
  }

  //return the arguments and the aggregate precondition
  return &as->instantiation(args, *problem, *preconds.top());
}


void summarize_results(const Problem *problem, const State *s, std::ostream& os)
{
  if (!problem || !s)
    return;
  os << "<results>";
  if (problem->goal().holds(s->atoms(), s->values()))
    os << "goal achieved";
  else
    os << "time expired";
  if (!problem->constant_metric())
    os << "<metric>" << problem->metric().value(s->values()) << "</metric>";
  os << "</results>" << std::endl;
}

int read_last_id()
{
  std::ifstream is("last_id");
  if (!is.is_open())
    return 0;
  int id;
  is >> id;
  is.close();
  return id;
}

void write_last_id(int id)
{
  std::ofstream os("last_id");
  os << id << std::endl;
  os.close();
}

int new_id()
{
  static int last_id = read_last_id();
  last_id++;
  write_last_id(last_id);
  return last_id;
}

static long get_time_milli()
{
  struct timeval t;
  gettimeofday(&t, NULL);
  return (t.tv_sec%100000)*1000 + t.tv_usec/1000;
}

void* host_problem(void *arg)
{
  int_pair p = *(int_pair*)arg;

  int client_socket = p.first;
  delete (int_pair*)arg;

#if defined __GNUC__ && __GNUC__ >= 3
  __gnu_cxx::stdio_filebuf<char> ofbuf(client_socket, std::ios_base::out, BUFSIZ);
  __gnu_cxx::stdio_filebuf<char> ifbuf(client_socket, std::ios_base::in, 1);
  // if above don't compile, try these ...
  //__gnu_cxx::stdio_filebuf<char> ofbuf(client_socket, std::ios_base::out, false, BUFSIZ);
  //__gnu_cxx::stdio_filebuf<char> ifbuf(client_socket, std::ios_base::in, false, 1);
#else
  std::filebuf ofbuf(client_socket);
  std::filebuf ifbuf(client_socket);
#endif
  std::ostream os(&ofbuf);
  std::istream is(&ifbuf);

  std::string contestant_name;
  std::string problem_name;

  const Problem* problem = 0;

  XMLNode *init_node = 0;
  is >> init_node;

  if (!init_node || init_node->getName() != "session-request") {
    close(client_socket);
    return NULL;
  }
  
  if (!dissectNode(init_node, "name", contestant_name) || contestant_name.length() == 0) {
    close(client_socket);
    return NULL;
  }
  
  if (!dissectNode(init_node, "problem", problem_name) || problem_name.length() == 0) {
    close(client_socket);
    return NULL;
  }

  int id = new_id();
  
  std::cout << "Contestant " << contestant_name << " running problem " << problem_name << "(" << id << ")" << std::endl;
  
  delete init_node;
  
  problem = Problem::find(problem_name);
  
  if (!problem) {
    os << "<error>bad problem \""
       << problem_name << "\"</error>" << std::endl;
    close(client_socket);
    return NULL;
  }

  Problem_CFG cfg;
  CFG_map::iterator cfg_itr = config_map.find(problem_name);
  if (cfg_itr != config_map.end()) {
    cfg = cfg_itr->second;
  }
  else {
    //Problem_CFG cfg = config_map[problem_name];
    cfg.round_limit=30;
    cfg.time_limit=1800000;
    cfg.turn_limit=2000;
    std::cerr << "There is no config entry for requested problem "
              << problem_name << ", using default." << std::endl;
  }

  os << "<session-init>"
     << "<sessionID>" << id << "</sessionID>"
     << "<setting>"
     << "<rounds>" << cfg.round_limit << "</rounds>"
     << "<allowed-time>" << cfg.time_limit << "</allowed-time>"
     << "<allowed-turns>" << cfg.turn_limit << "</allowed-turns>"
     << "</setting>"
     << "</session-init>" << std::endl;

  long start_time_session = get_time_milli();

  int rounds_done = 0;

  Rational total_metric = 0;
  time_t total_time = 0;
  int success_count = 0;
  int total_turns = 0;

  char timebuff[32];
  time_t logtime = time(0);

  while (rounds_done < cfg.round_limit) {
    //create initial state
    const State *s = new State(*problem);
    int turn = 0;

    bool goal;

    XMLNodePtr roundReq = 0;
    is >> roundReq;

    if (!roundReq || roundReq->getName() != "round-request") {
      close(client_socket);
      return NULL;
    }

    delete roundReq;

    bool running = true;

    long start_time = get_time_milli();
    long time_since = start_time-start_time_session;
    long time_left = cfg.time_limit-time_since;

    if  (time_since >= cfg.time_limit) {
      //std::cout << "out of time" << std::endl;
      running = false;
    }

    os << "<round-init>";
    os << "<round>" << rounds_done+1 << "</round>";
    os << "<sessionID>" << id << "</sessionID>";
    os << "<time-left>" << time_left << "</time-left>";
    os << "<rounds-left>" << cfg.round_limit-(rounds_done+1) << "</rounds-left>";
    os << "</round-init>" << std::endl;

    while (running && turn<cfg.turn_limit &&
	   !(goal = problem->goal().holds(s->atoms(), s->values()))) {

      s->printXML(os, problem->domain().predicates(),
		  problem->domain().functions(), problem->terms(), false);

      os << std::endl;

      const Action *action = NULL;
      XMLNodePtr actnode = 0;
      is >> actnode;

      if (!actnode) {
	delete s;
       	close(client_socket);
	std::cerr << contestant_name << " in session " << id
                  << " issued invalid XML action; connection killed."
		  << std::endl;
	return 0;
      }

      if (actnode->getName() == "noop") {
	continue;
      }

      if (actnode->getName() == "done") {
	//std::cout << "done" << std::endl;
	running = false;
      }

      if (actnode->getName() == "act") {
	XMLNodePtr actionnode = actnode->getChild("action");
	str_vec params;
	params.push_back(actionnode->getChild("name")->getText());
	for (int i=1; i<actionnode->size(); i++)
	  params.push_back(actionnode->getChild(i)->getText());

	action = make_action(params, problem);
	if (!action) {
	  os << "<error>bad action</error>" << std::endl;
	  continue;
	}

        if( !action->precondition().holds(s->atoms(),s->values()) ) {  // added by Blai Bonet
          os << "<error>precondition doesn't hold</error>" << std::endl;
          continue;
        }
      }

      delete actnode;

      long cur_time = get_time_milli();
      if  (cur_time-start_time_session >= cfg.time_limit) {
	//std::cout << "out of time" << std::endl;
	running = false;
      }
      
      if (running) {
        const State& next_s = s->next(action);
        delete s;
        s = &next_s;
        turn++;
      }
    } 

    total_metric = total_metric + problem->metric().value(s->values());
    
    long cur_time = get_time_milli();

    if (goal) {
      //std::cout << "got goal" << std::endl;
      total_time += (cur_time-start_time);
      total_turns += turn;
      success_count++;
    }

    //logtime = time(0);
    //std::string time(ctime_r(&logtime,timebuff));
    std::string log_file = log_dir+"/"+contestant_name+"-"+problem_name;
    std::ofstream log_out(log_file.c_str(), std::ios::app);
    log_out << "<end-round>";
    log_out << "<round>" << rounds_done+1 << "</round>";
    log_out <<  "<sessionID>" << id << "</sessionID>";
    s->printXML(log_out, problem->domain().predicates(),
		problem->domain().functions(), problem->terms(), goal);
    if (goal)
      log_out << "<goal-reached/>";
    log_out << "<time-spent>" << cur_time-start_time << "</time-spent>";
    log_out << "<turns-used>" << turn << "</turns-used>";
    log_out << "</end-round>" << std::endl;
    log_out.close();

    os << "<end-round>";
    os << "<sessionID>" << id << "</sessionID>";
    os << "<round>" << rounds_done+1 << "</round>";
    s->printXML(os, problem->domain().predicates(),
		problem->domain().functions(), problem->terms(), goal);
    if (goal)
      os << "<goal-reached/>";
    os << "<time-spent>" << cur_time-start_time << "</time-spent>";
    os << "<turns-used>" << turn << "</turns-used>";
    os << "</end-round>" << std::endl;
    
    delete s;
    
    rounds_done++;

    //if (cur_time-start_time_session >= cfg.time_limit)
    //  break;
  }
  
  os << "<end-session>";
  os <<  "<sessionID>" << id << "</sessionID>";
  os <<  "<problem>" << problem_name << "</problem>";
  os <<  "<rounds>" << rounds_done << "</rounds>";
  os <<  "<goals>";
  os <<   "<failed>" << cfg.round_limit-success_count << "</failed>";
  os <<   "<reached>";
  os <<    "<successes>" << success_count << "</successes>";
  if (success_count) {
    os <<  "<time-average>" << total_time/success_count << "</time-average>";
  }
  os <<   "</reached>";
  os <<  "</goals>";
  os <<  "<metric-average>" << total_metric/cfg.round_limit << "</metric-average>";
  os << "</end-session>" << std::endl;
  os.flush();

  close(client_socket);

  //make a log entry
  std::string log_file = log_dir+"/"+contestant_name+"-"+problem_name;
  //std::string log_file = "logs/"+contestant_name;
  std::ofstream log_out(log_file.c_str(), std::ios::app);

  log_out << "<end-session>" << std::endl;
  log_out << " <sessionID>" << id << "</sessionID>" << std::endl;  
  log_out << " <name>" << contestant_name << "</name>" << std::endl;
  log_out << " <problem>" << problem_name << "</problem>" << std::endl;
  log_out << " <rounds>" << rounds_done << "</rounds>" << std::endl;
  log_out << " <goals>" << std::endl;
  log_out << "  <failed>" << cfg.round_limit-success_count << "</failed>" << std::endl;
  log_out << "  <reached>" << std::endl;
  log_out << "   <successes>" << success_count << "</successes>" << std::endl;
  if (success_count) {
    log_out << "   <time-average>" << total_time/success_count << "</time-average>" << std::endl;
    log_out << "   <turn-average>" << (double)total_turns/(double)success_count << "</turn-average>" << std::endl;
  }
  log_out << "  </reached>" << std::endl;
  log_out << " </goals>" << std::endl;
  log_out << " <metric-average>" << total_metric/cfg.round_limit << "</metric-average>" << std::endl;
  log_out << "</end-session>" << std::endl;

  std::cout << "session " << id << " complete" << std::endl;

  /*
    log_out << problem_name << ": " << time;
    if (!problem->constant_metric())
    log_out << ", " << problem->metric().value(s->values());
    log_out << std::endl;
  */
  log_out.close();
  
  return NULL;
}

//someone set up us the server
int run_server(int port, int limit)
{
  struct sockaddr_in addr;
  int server_socket;

  if ((server_socket = socket(AF_INET, SOCK_STREAM, 0)) == -1)
    return -1;

  int j=1;
  setsockopt(server_socket, SOL_SOCKET, SO_REUSEADDR, (char*) &j, sizeof(int));

  addr.sin_family=AF_INET;
  addr.sin_port=htons(port);
  //setting to zero means use first IP of machine
  memset(&addr.sin_addr, 0, sizeof(addr.sin_addr));

  if (bind(server_socket, (struct sockaddr*)&addr, sizeof(addr))) {
    std::cerr << "could not bind socket" << std::endl;
    return -1;
  }

  if (listen(server_socket, 5)) {
    std::cerr << "could not listen" << std::endl;
    return -1;
  }
  
  std::cout << "mdpsim is running a server on port " << port << std::endl;


  int client_socket;
  socklen_t addrlength = sizeof(addr);
  while ((client_socket=accept(server_socket, (struct sockaddr*)&addr, &addrlength)) >= 0) {
    int_pair *p = new int_pair;
    p->first = client_socket;
    p->second = limit;
    ///*
    pthread_attr_t t_attr;
    pthread_t t_id;
    pthread_attr_init(&t_attr);
    pthread_create(&t_id, &t_attr, host_problem, p);
    //*/
    //host_problem(p);
  }
  std::cout << client_socket << std::endl;
  
  close(server_socket);
  return 0;
}

