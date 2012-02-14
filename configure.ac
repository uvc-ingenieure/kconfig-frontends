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
# Set misc options
# Although there is a default (="linux") in the code, we do provide
# a default here, to get a consistent autostuff behavior
AC_ARG_ENABLE(
    [package-name],
    [AS_HELP_STRING(
        [--enable-package-name],
        [set the package name (default=kconfig-frontends)])],
    [AS_CASE(
        ["$enableval"],
        [yes], [package_name=$PACKAGE_NAME],
        [no],  [package_name=],
               [package_name=$enableval])])
AC_SUBST([package_name], [${package_name=$PACKAGE_NAME}])

#----------------------------------------
# Options to selectively enable/disable frontends
# All are selected by default
AC_ARG_ENABLE(
    [conf],
    [AS_HELP_STRING(
        [--disable-conf],
        [conf, the stdin-based frontend (default=enabled)])])
AC_SUBST([enable_conf], [${enable_conf:-auto}])
AC_ARG_ENABLE(
    [mconf],
    [AS_HELP_STRING(
        [--disable-mconf],
        [mconf, the traditional ncurses-based frontend (default=enabled)])])
AC_SUBST([enable_mconf], [${enable_mconf:-auto}])
AC_ARG_ENABLE(
    [nconf],
    [AS_HELP_STRING(
        [--disable-nconf],
        [nconf, the modern ncurses-based frontend (default=enabled)])])
AC_SUBST([enable_nconf], [${enable_nconf:-auto}])
AC_ARG_ENABLE(
    [gconf],
    [AS_HELP_STRING(
        [--disable-gconf],
        [gconf, the GTK-based frontend (default=enabled)])])
AC_SUBST([enable_gconf], [${enable_gconf:-auto}])
AC_ARG_ENABLE(
    [qconf],
    [AS_HELP_STRING(
        [--disable-qconf],
        [qconf, the QT-based frontend (default=enabled)])])
AC_SUBST([enable_qconf], [${enable_qconf:-auto}])

#----------------------------------------
# Some program checks
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
# Check for ncurses, for the mconf & nconf frontends
AS_CASE(
    ["$enable_mconf":"$enable_nconf"],
    [yes:*],  [need_curses=yes],
    [*:yes],  [need_curses=yes],
    [auto:*], [need_curses=auto],
    [*:auto], [need_curses=auto],
              [need_curses=no])

AS_IF(
    [test "$need_curses" = "yes" -o "$need_curses" = "auto"],
    [AC_SUBST([CURSES_LOC])
     AC_SUBST([ncurses_LIBS])
     LIBS_old="$LIBS"
     AC_CHECK_HEADERS(
        [ncurses/ncurses.h ncurses/curses.h ncursesw/curses.h ncurses.h curses.h],
        [CURSES_LOC=$ac_header; break])
     AS_IF(
        [test -z "$CURSES_LOC"],
        [AS_IF(
            [test "$need_curses" = "yes"],
            [AC_MSG_ERROR([could not find curses headers (frontends: mconf/nconf)])],
            [has_curses=no])])
     AC_SEARCH_LIBS(
        [initscr],
        [ncursesw ncurses curses],
        [ac_ct_curses_lib_found=yes; break])
     AS_IF(
        [test -z "$ac_ct_curses_lib_found"],
        [AS_IF(
            [test "$need_curses" = "yes"],
            [AC_MSG_ERROR([could not find curses library (frontends: mconf/nconf)])],
            [has_curses=no])])
     ncurses_LIBS="$LIBS"
     LIBS=$LIBS_old])

AS_IF(
    [test "$has_curses" = "no" ],
    [enable_mconf=no; enable_nconf=no])

#----------------------------------------
# Check for libpanel and libmenu, for the nconf frontend
[need_panel_menu="$enable_nconf"]

AS_IF(
    [test "$need_panel_menu" = "yes" -o "$need_panel_menu" = "auto"],
    [AC_SUBST([ncurses_extra_LIBS])
     LIBS_old="$LIBS"
     AC_SEARCH_LIBS(
        [new_panel],
        [panel],
        [ac_ct_panel_lib_found=yes; break])
     AS_IF(
        [test -z "$ac_ct_panel_lib_found"],
        [AS_IF(
            [test "$need_panel_menu" = "yes"],
            [AC_MSG_ERROR([could not find libpanel library (frontend: nconf)])],
            [has_panel_menu=no])])
     AC_SEARCH_LIBS(
        [menu_init],
        [menu],
        [ac_ct_menu_lib_found=yes; break])
     AS_IF(
        [test -z "$ac_ct_panel_lib_found"],
        [AS_IF(
            [test "$need_panel_menu" = "yes"],
            [AC_MSG_ERROR([could not find libmenu library (frontend: nconf)])],
            [has_panel_menu=no])])
     ncurses_extra_LIBS="$LIBS"
     LIBS=$LIBS_old])

AS_IF(
    [test "$has_panel_menu" = "no" ],
    [enable_nconf=no])

#----------------------------------------
# Check if the lxdialog library should be built
AS_IF(
    [test "$enable_mconf" = "yes" -o "$enable_mconf" = "auto"],
    [need_lxdialog=yes],
    [need_lxdialog=no])

#----------------------------------------
# Check pkg-config if needed
AS_CASE(
    ["$enable_gconf":"$enable_qconf"],
    [yes:*],  [need_pkgconfig=yes],
    [*:yes],  [need_pkgconfig=yes],
    [auto:*], [need_pkgconfig=yes],
    [*:auto], [need_pkgconfig=yes],
              [need_pkgconfig=no ])

AS_IF(
    [test "$need_pkgconfig" = "yes"],
    [PKG_PROG_PKG_CONFIG()])

#----------------------------------------
# Check headers and libs for gconf
[need_gtk="$enable_gconf"]

AS_IF(
    [test "$need_gtk" = "yes" -o "$need_gtk" = "auto"],
    [PKG_CHECK_MODULES(
        [gtk],
        [gtk+-2.0 gmodule-2.0 libglade-2.0],
        [has_gtk=yes],
        [AS_IF(
            [test "$need_gtk" = "yes"],
            [AC_MSG_ERROR([could not find GTK+ headers and/or libraries (frontend: gconf)])],
            [has_gtk=no])])])

AS_IF(
    [test "$has_gtk" = "no" ],
    [enable_gconf=no])

#----------------------------------------
# Check headers and libs for gconf
[need_qt="$enable_qconf"]

AS_IF(
    [test "$need_qt" = "yes" -o "$need_qt" = "auto"],
    [PKG_CHECK_MODULES(
        [qt4],
        [QtCore QtGui Qt3Support],
        [has_qt=yes],
        [AS_IF(
            [test "$need_qt" = "yes"],
            [AC_MSG_ERROR([could not find QT4 headers and/or libraries (frontend: qconf)])],
            [has_qt=no])])])

AS_IF(
    [test "$has_qt" = "no" ],
    [enable_qconf=no])

#---------------------------------------------------------------------------
# Now, we know what frontends to enable
AS_IF([test "$enable_conf"  = "auto"], [enable_conf=yes ])
AS_IF([test "$enable_gconf" = "auto"], [enable_gconf=yes])
AS_IF([test "$enable_mconf" = "auto"], [enable_mconf=yes])
AS_IF([test "$enable_nconf" = "auto"], [enable_nconf=yes])
AS_IF([test "$enable_qconf" = "auto"], [enable_qconf=yes])

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

#---------------------------------------------------------------------------
# Prepare libtool
LT_INIT([disable-static])

#----------------------------------------
# Get the version to apply to the parser shared library
AC_SUBST(
    [KCONFIGPARSER_LIB_VERSION],
    [m4_esyscmd_s([./scripts/version.sh --plain])])

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
AC_MSG_NOTICE([- package name: '$package_name'])
AC_MSG_NOTICE([- frontends:])
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
AC_MSG_NOTICE([- parser library:])
AS_IF([test "$enable_shared" = "yes"],
      [AC_MSG_NOTICE([  - shared: yes, versioned $KCONFIGPARSER_LIB_VERSION])],
      [AC_MSG_NOTICE([  - shared: no])])
AC_MSG_NOTICE([  - static: $enable_static])
