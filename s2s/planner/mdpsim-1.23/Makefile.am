## Process this file with automake to produce Makefile.in
##
## Copyright (C) 2003 Carnegie Mellon University and Rutgers University
##
## Permission is hereby granted to distribute this software for
## non-commercial research purposes, provided that this copyright
## notice is included with any such distribution.
##
## THIS SOFTWARE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
## EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
## IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
## PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
## SOFTWARE IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU
## ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
##
## $Id: Makefile.am,v 1.6 2004/04/08 01:31:36 hakan Exp $

bin_PROGRAMS = mdpsim mdpclient
EXTRA_PROGRAMS = mtbddclient
mdpsim_SOURCES = mdpsim.cc mdpserver.cc mdpserver.h strxml.cc strxml.h hashing.h exceptions.cc exceptions.h requirements.cc requirements.h rational.cc rational.h types.cc types.h terms.cc terms.h predicates.cc predicates.h functions.cc functions.h expressions.cc expressions.h formulas.cc formulas.h effects.cc effects.h actions.cc actions.h domains.cc domains.h problems.cc problems.h states.cc states.h parser.yy tokenizer.ll
mdpclient_SOURCES = mdpclient.cc client.cc client.h strxml.cc strxml.h hashing.h exceptions.cc exceptions.h requirements.cc requirements.h rational.cc rational.h types.cc types.h terms.cc terms.h predicates.cc predicates.h functions.cc functions.h expressions.cc expressions.h formulas.cc formulas.h effects.cc effects.h actions.cc actions.h domains.cc domains.h problems.cc problems.h states.cc states.h tokenizer.ll
mtbddclient_SOURCES = mtbddtest.cc mtbdd.cc mtbdd.h client.cc client.h strxml.cc strxml.h hashing.h exceptions.cc exceptions.h requirements.cc requirements.h rational.cc rational.h types.cc types.h terms.cc terms.h predicates.cc predicates.h functions.cc functions.h expressions.cc expressions.h formulas.cc formulas.h effects.cc effects.h actions.cc actions.h domains.cc domains.h problems.cc problems.h states.cc states.h tokenizer.ll

mdpsim_LDADD = @LIBOBJS@ @PTHREADLIB@
mdpclient_LDADD = parser.o
mtbddclient_LDADD = parser.o -lcudd -lepd -lmtr -lst -lutil @LIBOBJS@

CLEANFILES = logs/*
MAINTAINERCLEANFILES = parser.cc tokenizer.cc config.h.in~
EXTRA_DIST = getopt.c getopt1.c getopt.h comp.cfg examples logs PROTOCOL

CPPFLAGS = @CPPFLAGS@ -I@CUDDDIR@
LDFLAGS = @LDFLAGS@ -L@CUDDDIR@

YFLAGS = -d
