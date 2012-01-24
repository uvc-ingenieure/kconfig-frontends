#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.67])
AC_INIT(
    [kconfig-frontends],
    [m4_esyscmd_s([./scripts/version.sh])],
    [nobody@nowhere.org])
AC_CONFIG_SRCDIR([frontends/conf/conf.c])
# Use a config.h to avoid brazilions -DHAVE_FOO on compile lines
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_AUX_DIR([scripts])

# Checks for programs.
AC_PROG_CC
AC_PROG_CXX
AC_PROG_MAKE_SET

# Checks for libraries.
# (none)

# Checks for header files.
AC_HEADER_STDC
# The folowing AC_CHECK_HEADERS was a single big line
AC_CHECK_HEADERS([ fcntl.h libintl.h limits.h locale.h ])
AC_CHECK_HEADERS([ stdlib.h string.h sys/time.h unistd.h ])

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_C_INLINE
AC_TYPE_SIZE_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_FUNC_ALLOCA
# The following AC_CHECK_FUNCS was a single big line
AC_CHECK_FUNCS([ bzero memmove memset ])
AC_CHECK_FUNCS([ strcasecmp strchr strcspn strdup strncasecmp strpbrk strrchr strspn strtol ])
AC_CHECK_FUNCS([ gettimeofday mkdir regcomp setlocale uname ])

# End of the autoscan-detected stuff
#---------------------------------------------------------------------------

#----------------------------------------
# Options to selectively enable/disable frontends
# All are selected by default
AC_ARG_ENABLE(
    [conf],
    [AS_HELP_STRING(
        [--disable-conf],
        [conf, the stdin-based frontend (default=yes)])])
AC_SUBST([enable_conf], [${enable_conf:-yes}])
AC_ARG_ENABLE(
    [mconf],
    [AS_HELP_STRING(
        [--disable-mconf],
        [mconf, the traditional ncurses-based frontend (default=yes)])])
AC_SUBST([enable_mconf], [${enable_mconf:-yes}])
AC_ARG_ENABLE(
    [nconf],
    [AS_HELP_STRING(
        [--disable-nconf],
        [nconf, the modern ncurses-based frontend (default=yes)])])
AC_SUBST([enable_nconf], [${enable_nconf:-yes}])
AC_ARG_ENABLE(
    [gconf],
    [AS_HELP_STRING(
        [--disable-gconf],
        [gconf, the GTK-based frontend (default=yes)])])
AC_SUBST([enable_gconf], [${enable_gconf:-yes}])
AC_ARG_ENABLE(
    [qconf],
    [AS_HELP_STRING(
        [--disable-qconf],
        [qconf, the QT-based frontend (default=yes)])])
AC_SUBST([enable_qconf], [${enable_qconf:-yes}])

#----------------------------------------
# Some program checks
AC_PROG_RANLIB
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

#----------------------------------------
# Check for gettext, for the kconfig frontends
AC_SUBST([GETTEXT])
AC_CHECK_HEADERS(
    [libintl.h],
    [ac_ct_gettext_hdr=$ac_header; break],
    [AC_MSG_WARN([libintl is missing, frontends will not be localised])])
AS_IF(
    [test -n "$ac_ct_gettext_hdr"],
    [AC_CHECK_DECL(
        [gettext],,
        [AC_MSG_WARN([gettext is missing, frontends will not be localised])
         GETTEXT=-DKBUILD_NO_NLS],
        [#include <$ac_ct_gettext_hdr>])])

#----------------------------------------
# Check for ncurses, for the kconfig frontends
AS_IF(
    [test "$enable_mconf" = "yes" -o "$enable_nconf" = "yes"],
    [AC_SUBST([CURSES_LOC])
     AC_CHECK_HEADERS(
        [ncurses/ncurses.h ncurses/curses.h ncursesw/curses.h ncurses.h curses.h],
        [CURSES_LOC=$ac_header; break])
     AS_IF(
        [test -z "$CURSES_LOC"],
        [AC_MSG_ERROR([could not find curses headers])])
     AC_SEARCH_LIBS(
        [initscr],
        [ncursesw ncurses curses],
        [ac_ct_curses_lib_found=yes; break])
     AS_IF(
        [test -z "$ac_ct_curses_lib_found"],
        [AC_MSG_ERROR([could not find curses library])])])

AS_IF(
    [test "$enable_nconf" = "yes"],
    [AC_SEARCH_LIBS(
        [new_panel],
        [panel],
        [ac_ct_panel_lib_found=yes; break])
     AS_IF(
        [test -z "$ac_ct_panel_lib_found"],
        [AC_MSG_ERROR([could not find libpanel library])])
     AC_SEARCH_LIBS(
        [menu_init],
        [menu],
        [ac_ct_menu_lib_found=yes; break])
     AS_IF(
        [test -z "$ac_ct_panel_lib_found"],
        [AC_MSG_ERROR([could not find libmenu library])])])

#----------------------------------------
# Check if the lxdialog library should be built
AS_IF(
    [test "$enable_mconf" = "yes"],
    [need_lxdialog=yes],
    [need_lxdialog=no])

#----------------------------------------
# Check pkg-config if needed
AS_IF(
    [test    "$enable_gconf" = "yes"    \
          -o "$enable_qconf" = "yes"],
    [PKG_PROG_PKG_CONFIG()])

#----------------------------------------
# Check headers and libs for gconf
AS_IF(
    [test "$enable_gconf" = yes ],
    [PKG_CHECK_MODULES(
        [gtk],
        [gtk+-2.0 gmodule-2.0 libglade-2.0])])

#----------------------------------------
# Check headers and libs for gconf
AS_IF(
    [test "$enable_qconf" = "yes"],
    [PKG_CHECK_MODULES(
        [qt4],
        [QtCore QtGui Qt3Support])])

#---------------------------------------------------------------------------
# Prepare automake
AM_INIT_AUTOMAKE
AM_PROG_CC_C_O
AM_CONDITIONAL(
    [COND_conf],
    [test "$enable_conf" = "yes"])
AM_CONDITIONAL(
    [COND_mconf],
    [test "$enable_mconf" = "yes"])
AM_CONDITIONAL(
    [COND_nconf],
    [test "$enable_nconf" = "yes"])
AM_CONDITIONAL(
    [COND_gconf],
    [test "$enable_gconf" = "yes"])
AM_CONDITIONAL(
    [COND_qconf],
    [test "$enable_qconf" = "yes"])
AM_CONDITIONAL(
    [COND_lxdialog],
    [test "$need_lxdialog" = "yes"])

#----------------------------------------
# Finalise
AC_CONFIG_FILES([
    Makefile
    libs/Makefile
    libs/lxdialog/Makefile
    libs/parser/Makefile
    frontends/Makefile
    frontends/conf/Makefile
    frontends/mconf/Makefile
    frontends/nconf/Makefile
    frontends/gconf/Makefile
    frontends/qconf/Makefile
])
AC_OUTPUT

AC_MSG_NOTICE([Configured with:])
AS_IF([test "$enable_conf" = "yes"],
      [AC_MSG_NOTICE([  - conf:  yes])],
      [AC_MSG_NOTICE([  - conf:  no])])
AS_IF([test "$enable_gconf" = "yes"],
      [AC_MSG_NOTICE([  - gconf: yes])],
      [AC_MSG_NOTICE([  - gconf: no])])
AS_IF([test "$enable_mconf" = "yes"],
      [AC_MSG_NOTICE([  - mconf: yes])],
      [AC_MSG_NOTICE([  - mconf: no])])
AS_IF([test "$enable_nconf" = "yes"],
      [AC_MSG_NOTICE([  - nconf: yes])],
      [AC_MSG_NOTICE([  - nconf: no])])
AS_IF([test "$enable_qconf" = "yes"],
      [AC_MSG_NOTICE([  - qconf: yes])],
      [AC_MSG_NOTICE([  - qconf: no])])
