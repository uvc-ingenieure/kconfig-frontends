#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.67])
AC_INIT([kconfig-frontends], [m4_esyscmd_s([cat .version])], [nobody@nowhere.org])
AC_CONFIG_SRCDIR([frontends/conf/conf.c])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_AUX_DIR([scripts])

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC
AC_PROG_MAKE_SET
AC_PROG_RANLIB

AM_INIT_AUTOMAKE
AM_PROG_CC_C_O
AC_PROG_LEX
AC_PROG_YACC
AC_CHECK_PROGS(
    [GPERF],
    [gperf])
AS_IF(
    [test -z "$GPERF"],
    [AC_MSG_ERROR([can not find gperf])])
AC_SUBST([AM_LFLAGS], ["-L -P zconf"])
AC_SUBST([AM_YFLAGS], ["-t -l -p zconf"])

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([ fcntl.h libintl.h limits.h locale.h stdlib.h string.h sys/time.h unistd.h ])

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_C_INLINE
AC_TYPE_SIZE_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_CHECK_FUNCS([ bzero gettimeofday memmove memset mkdir regcomp setlocale strcasecmp strchr strcspn strdup strncasecmp strpbrk strrchr strspn strtol uname ])

#----------------------------------------
AC_C_INLINE
AC_HEADER_STDC
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_FUNC_ALLOCA

#----------------------------------------
# Check for gettext, for the kconfig frontends
AC_SUBST([gettext])
AC_CHECK_HEADERS(
    [libintl.h],
    [ac_ct_gettext_hdr=$ac_header; break])
AS_IF(
    [test -n "$ac_ct_gettext_hdr"],
    [AC_CHECK_DECL(
        [gettext],[gettext=y],,
        [#include <$ac_ct_gettext_hdr>])])

#----------------------------------------
# Check for ncurses, for the kconfig frontends
AC_SUBST([CURSES_LOC])
AC_CHECK_HEADERS(
    [ncurses/ncurses.h ncurses/curses.h ncursesw/curses.h ncurses.h curses.h],
    [CURSES_LOC=$ac_header; break])
AS_IF(
    [test -z "$CURSES_LOC"],
    [AC_MSG_ERROR([could not find curses header, required for the kconfig frontends])])
AC_SEARCH_LIBS(
    [initscr],
    [ncursesw ncurses curses],
    [ac_ct_curses_lib_found=yes; break])
AS_IF(
    [test -z "$ac_ct_curses_lib_found"],
    [AC_MSG_ERROR([could not find curses library, required for the kconfig frontends])])



AC_CONFIG_FILES([
    Makefile
    lxdialog/Makefile
    parser/Makefile
    frontends/Makefile
    frontends/conf/Makefile
    frontends/mconf/Makefile
    frontends/nconf/Makefile
])
AC_OUTPUT
