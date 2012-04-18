bin_PROGRAMS = nconf

nconf_SOURCES = nconf.c nconf.gui.c nconf.h
nconf_CPPFLAGS = $(AM_CPPFLAGS) \
                 $(GETTEXT)     \
                 -I$(top_srcdir)/libs/parser
nconf_CFLAGS = $(AM_CFLAGS) \
               $(kf_CFLAGS)
nconf_LDADD = $(top_builddir)/libs/parser/libkconfig-parser.la  \
              $(ncurses_extra_LIBS) $(ncurses_LIBS)             \
              $(nconf_EXTRA_LIBS)
