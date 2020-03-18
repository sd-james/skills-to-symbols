/*
 * Main program.
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
 * $Id: mdpsim.cc,v 1.2 2004/03/10 23:01:00 john Exp $
 */
#include <climits>
#include "states.h"
#include "problems.h"
#include "domains.h"
#include "exceptions.h"
#include "mdpserver.h"
#if HAVE_GETOPT_LONG
#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <getopt.h>
#else
#include "getopt.h"
#endif
#include <iostream>
#include <fstream>
#include <cerrno>
#include <cstdio>
#include <ctime>
#include <string.h>

/* The parse function. */
extern int yyparse();
/* File to parse. */
extern FILE* yyin;

/* port to run server on */
int port;
/* Name of current file. */
std::string current_file;
/* Level of warnings. */
int warning_level;
/* Verbosity level. */
int verbosity;
/* Log dir */
std::string log_dir;

/* Program options. */
static struct option long_options[] = {
  { "port", required_argument, NULL, 'P'},
  { "config", required_argument, NULL, 'C'},
  { "limit", required_argument, NULL, 'L' },
  { "log-dir", optional_argument, NULL, 'l' },
  { "seed", required_argument, NULL, 'S' },
  { "verbose", optional_argument, NULL, 'v' },
  { "version", no_argument, NULL, 'V' },
  { "warnings", optional_argument, NULL, 'W' },
  { "help", no_argument, NULL, '?' },
  { 0, 0, 0, 0 }
};
static const char OPTION_STRING[] = "P:C:L:l:S:v::VW::?";

/* Displays help. */
static void display_help() {
  std::cout << "usage: " << PACKAGE << " [options] [file ...]" << std::endl
	    << "options:" << std::endl
            << "         --port=p\t"
            << "run the simulation as a server on port p" << std::endl
            << "  -l <dir>, --log-dir=<dir>\t"
            << "use <dir> as repository for logs" << std::endl
	    << "  -L l,  --limit=l\t"
	    << "simulate no more than l state transitions" << std::endl
	    << "  -S s,  --seed=s\t"
	    << "uses s as seed for random number generator" << std::endl
	    << "  -v[n], --verbose[=n]\t"
	    << "use verbosity level n;" << std::endl
	    << "\t\t\t  n is a number from 0 (verbose mode off) and up;"
	    << std::endl
	    << "\t\t\t  default level is 1 if optional argument is left out"
	    << std::endl
	    << "  -V,    --version\t"
	    << "display version information and exit" << std::endl
	    << "  -W[n], --warnings[=n]\t"
	    << "determines how warnings are treated;" << std::endl
	    << "\t\t\t  0 supresses warnings; 1 displays warnings;"
	    << std::endl
	    << "\t\t\t  2 treats warnings as errors" << std::endl
	    << "  -?     --help\t\t"
	    << "display this help and exit" << std::endl
	    << "  file ...\t\t"
	    << "files containing domain and problem descriptions;" << std::endl
	    << "\t\t\t  if none, descriptions are read from standard input"
	    << std::endl
	    << std::endl
	    << "Report bugs to <" PACKAGE_BUGREPORT ">." << std::endl;
}


/* Displays version information. */
static void display_version() {
  std::cout << PACKAGE_STRING << std::endl
	    << "Copyright (C) 2003 Carnegie Mellon University"
	    << " and Rutgers University" << std::endl
	    << PACKAGE_NAME
	    << " comes with NO WARRANTY, to the extent permitted by law."
	    << std::endl
	    << "For information about the terms of redistribution,"
	    << std::endl
	    << "see the file named COPYING in the " PACKAGE_NAME
	    << " distribution." << std::endl;
}


/* Parses the given file, and returns true on success. */
static bool read_file(const char* name) {
  yyin = fopen(name, "r");

  if (yyin == NULL) {
    std::cerr << PACKAGE << ':' << name << ": " << strerror(errno)
	      << std::endl;
    return false;
  } else {
    current_file = name;
    bool success = (yyparse() == 0);
    fclose(yyin);
    return success;
  }
}


/* Selects an action for the given state. */
static const Action* action_selection(const AtomSet& atoms,
				      const ValueMap& values,
				      const Problem& problem) {
  ActionList actions;
  problem.enabled_actions(actions, atoms, values);
  if (actions.empty()) {
    return NULL;
  } else {
    size_t i = size_t(rand()/(RAND_MAX + 1.0)*actions.size());
    return actions[i];
  }
}


/* The main program. */
int main(int argc, char* argv[]) {
  /* config file for problem specific restrictions */
  char *config = 0;
  /* port=0 means no server */
  port = 0;
  /* Set default verbosity. */
  verbosity = 0;
  /* Set default warning level. */
  warning_level = 1;
  /* Set default seed. */
  size_t seed = time(NULL);
  /* Set default simulation limit. */
  size_t limit = UINT_MAX;
  /* Set default log dir. */
  log_dir = "logs";

  /*
   * Get command line options.
   */
  while (1) {
    int option_index = 0;
    int c = getopt_long(argc, argv, OPTION_STRING,
			long_options, &option_index);
    if (c == -1) {
      break;
    }
    switch (c) {
    case 'P':
      port = atoi(optarg);
      break;
    case 'C':
      config = optarg;
      break;
    case 'l':
      if( optarg != 0 ) log_dir = (char*)optarg;
      break;
    case 'L':
      limit = atoi(optarg);
      break;
    case 'S':
      seed = atoi(optarg);
      break;
    case 'v':
      verbosity = (optarg != NULL) ? atoi(optarg) : 1;
      break;
    case 'V':
      display_version();
      return 0;
    case 'W':
      warning_level = (optarg != NULL) ? atoi(optarg) : 1;
      break;
    case '?':
      if (optopt == '?') {
	display_help();
	return 0;
      }
    case ':':
    default:
      std::cerr << "Try `" PACKAGE " --help' for more information."
		<< std::endl;
      return -1;
    }
  }
  srand(seed);

  std::cout << "log-dir=" << log_dir << std::endl;

  try {
    /*
     * Read pddl files.
     */
    if (optind < argc) {
      /*
       * Use remaining command line arguments as file names.
       */
      while (optind < argc) {
	if (!read_file(argv[optind++])) {
	  return -1;
	}
      }
    } else {
      /*
       * No remaining command line argument, so read from standard input.
       */
      yyin = stdin;
      if (yyparse() != 0) {
	return -1;
      }
    }

    if (verbosity > 0) {
      std::cerr << "using seed " << seed << std::endl;
    }
    if (verbosity > 1) {
      /*
       * Display domains and problems.
       */
      std::cerr << "----------------------------------------"<< std::endl
		<< "domains:" << std::endl;
      for (Domain::DomainMap::const_iterator di = Domain::begin();
	   di != Domain::end(); di++) {
	std::cerr << std::endl << *(*di).second << std::endl;
      }
      std::cerr << "----------------------------------------"<< std::endl
		<< "problems:" << std::endl;
      for (Problem::ProblemMap::const_iterator pi = Problem::begin();
	   pi != Problem::end(); pi++) {
	std::cerr << std::endl << *(*pi).second << std::endl;
      }
      std::cerr << "----------------------------------------"<< std::endl;
    }

    if (!port) {
      for (Problem::ProblemMap::const_iterator pi = Problem::begin();
	   pi != Problem::end(); pi++) {
	const Problem& problem = *(*pi).second;
	if (verbosity > 0) {
	  std::cerr << "simulating problem `" << problem.name() << "'"
		    << std::endl;
	}
	const State* s = new State(problem);
	size_t time = 0;
	while (time < limit
	       && !problem.goal().holds(s->atoms(), s->values())) {
	  std::cout << std::endl << time << ": ";
	  s->print(std::cout, problem.domain().predicates(),
		   problem.domain().functions(), problem.terms());
	  std::cout << std::endl;
	  const Action* action =
	    action_selection(s->atoms(), s->values(), problem);
	  const State& next_s = s->next(action);
	  delete s;
	  s = &next_s;
	  time++;
	}
	std::cout << std::endl << time << ": ";
	s->print(std::cout, problem.domain().predicates(),
		 problem.domain().functions(), problem.terms());
	std::cout << std::endl;
	if (problem.goal().holds(s->atoms(), s->values())) {
	  std::cout << "  goal achieved" << std::endl;
	} else {
	  std::cout << "  time limit reached" << std::endl;
	}
	if (!problem.constant_metric()) {
	  std::cout << "  value of maximization metric is "
		    << problem.metric().value(s->values()) << std::endl;
	}
	delete s;
      }
    } else {
      if (config) {
	std::ifstream fin(config);
	while (!fin.eof()) {
	  std::string problem_name;
	  fin >> problem_name;
	  if (problem_name.length() == 0)
	    break;
	  Problem_CFG cfg;
	  fin >> cfg.time_limit;
	  fin >> cfg.round_limit;
	  fin >> cfg.turn_limit;
	  config_map[problem_name] = cfg;
	}
	fin.close();
      }
      return run_server(port, limit);
    }
  } catch (const Exception& e) {
    std::cerr << PACKAGE ": " << e << std::endl;
    return -1;
  } catch (...) {
    std::cerr << PACKAGE ": fatal error" << std::endl;
    return -1;
  }

  Problem::clear();
  Domain::clear();

  return 0;
}
