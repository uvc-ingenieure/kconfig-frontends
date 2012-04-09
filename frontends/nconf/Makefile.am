bin_PROGRAMS = kconfig-nconf

kconfig_nconf_SOURCES = nconf.c nconf.gui.c nconf.h
kconfig_nconf_CPPFLAGS = $(AM_CPPFLAGS) \
                         $(GETTEXT)     \
                         -I$(top_srcdir)/libs/parser
kconfig_nconf_CFLAGS = $(AM_CFLAGS) \
                       $(kf_CFLAGS)
kconfig_nconf_LDADD = $(top_builddir)/libs/parser/libkconfig-parser.la  \
                      $(ncurses_extra_LIBS) $(ncurses_LIBS)             \
                      $(nconf_EXTRA_LIBS)
