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
 * $Id: mdpclient.cc,v 1.3 2004/03/10 22:34:41 john Exp $
 */
#include <iostream>
#include <fstream>
#include <cerrno>
#include <cstdio>
#include <ctime>
#if defined __GNUC__ && __GNUC__ >= 3
#include <ext/stdio_filebuf.h>
#endif
#include <string.h>
#include <stdio.h>

#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>

#include "states.h"
#include "problems.h"
#include "domains.h"
#include "exceptions.h"
#include "actions.h"

#include "client.h"

/* The parse function. */
extern int yyparse();
/* File to parse. */
extern FILE* yyin;
/* Name of current file. */
std::string current_file;
/* Level of warnings. */
int warning_level;
/* Verbosity level. */
int verbosity;


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

int connect(const char *hostname, int port)
{
  struct hostent *host = ::gethostbyname(hostname);
  if (!host) {
    perror("gethostbyname");
    return -1;
  }

  int sock = ::socket(PF_INET, SOCK_STREAM, 0);
  if (sock == -1) {
    perror("socket");
    return -1;
  }
  
  struct sockaddr_in addr;
  addr.sin_family=AF_INET;
  addr.sin_port=htons(port);
  addr.sin_addr = *((struct in_addr *)host->h_addr);
  memset(&(addr.sin_zero), '\0', 8);

  if (::connect(sock, (struct sockaddr*)&addr, sizeof(addr)) == -1) {
    perror("connect");
    return -1;
  }
  return sock;
  //remember to call close(sock) when you're done
}

class RandomPlanner : public Planner
{
public:
  RandomPlanner(const Problem& problem) : Planner(problem) { srand(time(0)); }
  virtual void initRound();
  virtual ~RandomPlanner() {}
  virtual const Action* decideAction(const State&);
  virtual void endRound();
};

void RandomPlanner::initRound()
{

}

void RandomPlanner::endRound()
{
  
}

const Action* RandomPlanner::decideAction(const State& state)
{
  ActionList actions;
  _problem.enabled_actions(actions, state.atoms(), state.values());

  if (actions.empty()) {
    return NULL;
  }
  else {
    size_t i = size_t(rand()/(RAND_MAX + 1.0)*actions.size());
    return actions[i];
  }
}

int main(int argc, char **argv)
{
  /* Set default verbosity. */
  verbosity = 0;
  /* Set default warning level. */
  warning_level = 1;
  if (argc != 4) {
    std::cerr << "Usage: " << *argv << " <host>:<port> <problem file> <problem name>" << std::endl;
    return 1;
  }

  if (!read_file(argv[2])) {
    std::cerr << "Couldn't read problem file " << argv[2] << std::endl;
    return 1;
  }

  const Problem *problem = Problem::find(argv[3]);
  if (!problem) {
    std::cerr << "Problem " << argv[3] << " is not defined in " << argv[2] << std::endl;
    return 1;
  }

  
  char *hostport = argv[1];
  char *host = strtok(hostport, ":");
  char *portstr = strtok(0, ":");
  int port = atoi(portstr);

  int socket = connect(host, port);
  if (socket <= 0) {
    std::cerr << "Could not connect to " << argv[1] << std::endl;
    return 1;
  }
#if defined __GNUC__ && __GNUC__ >= 3
  __gnu_cxx::stdio_filebuf<char> ofbuf(socket, std::ios_base::out, BUFSIZ);
  __gnu_cxx::stdio_filebuf<char> ifbuf(socket, std::ios_base::in, 1);
  // if above don't compile, try these ...
  //__gnu_cxx::stdio_filebuf<char> ofbuf(socket, std::ios_base::out, false, BUFSIZ);
  //__gnu_cxx::stdio_filebuf<char> ifbuf(socket, std::ios_base::in, false, 1);
#else
  std::filebuf ofbuf(socket);
  std::filebuf ifbuf(socket);
#endif
  std::ostream os(&ofbuf);
  std::istream is(&ifbuf);
  

  RandomPlanner p(*problem);

  XMLClient(&p, problem, "johnclient", is, os);
  
  //close(socket);

  return 0;
}
