/* -*-C++-*- */
/*
 * MDP Server.
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
 * $Id: mdpserver.h,v 1.1 2003/11/07 03:04:33 john Exp $
 */
#ifndef _MDPSERVER_H
#define _MDPSERVER_H

#include <map>
#include <time.h>
int run_server(int port, int limit);

struct Problem_CFG
{
  time_t time_limit;
  int round_limit;
  int turn_limit;
};

typedef std::map<std::string,Problem_CFG> CFG_map;
extern CFG_map config_map;

#endif
