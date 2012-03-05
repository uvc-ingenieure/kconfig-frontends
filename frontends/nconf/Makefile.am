bin_PROGRAMS = nconf

nconf_SOURCES = nconf.c nconf.gui.c nconf.h
nconf_CPPFLAGS = $(AM_CPPFLAGS)     \
                 $(GETTEXT)         \
                 -I../../libs/parser
nconf_LDADD = ../../libs/parser/libkconfigparser.la \
              $(ncurses_extra_LIBS) $(ncurses_LIBS)
