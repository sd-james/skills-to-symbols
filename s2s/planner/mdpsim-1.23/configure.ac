# Process this file with autoconf to produce a configure script.
#
# Copyright (C) 2003 Carnegie Mellon University and Rutgers University
#
# Permission is hereby granted to distribute this software for
# non-commercial research purposes, provided that this copyright
# notice is included with any such distribution.
#
# THIS SOFTWARE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
# EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
# SOFTWARE IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU
# ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
#
# $Id: configure.ac,v 1.2 2003/11/14 16:02:59 hakan Exp $

AC_INIT(MDPSim, 1.1, lorens@cs.cmu.edu)
AC_CONFIG_SRCDIR(mdpsim.cc)
AM_INIT_AUTOMAKE
AM_CONFIG_HEADER(config.h)

# Add option to set location of CUDD package.
AC_ARG_VAR(CUDDDIR, [location of the CUDD package])
CUDDDIR=${CUDDDIR:-./cudd}

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_AWK
AM_PROG_LEX
AC_PROG_YACC

# Set the language.
AC_LANG(C++)

# Checks for libraries.
AC_SEARCH_LIBS(gettext, intl)
AC_SEARCH_LIBS(accept, socket)
AC_SEARCH_LIBS(gethostbyname, nsl)
AC_CHECK_LIB(pthread, pthread_create, PTHREADLIB=-lpthread)
AC_SUBST(PTHREADLIB)

# Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS([arpa/inet.h libintl.h netdb.h netinet/in.h stddef.h stdlib.h string.h strings.h sys/socket.h unistd.h sys/time.h sstream])

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_C_CONST
AC_C_INLINE
AC_TYPE_SIZE_T
AC_CHECK_TYPES(socklen_t, , , [#include <sys/socket.h>])

# Checks for library functions.
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_CHECK_FUNCS([gethostbyname memset socket strerror])
AC_CHECK_FUNCS(getopt_long, , [AC_LIBOBJ(getopt) AC_LIBOBJ(getopt1)])

AC_CONFIG_FILES(Makefile)
AC_OUTPUT
