bin_PROGRAMS = nconf

nconf_SOURCES = nconf.c nconf.gui.c nconf.h
nconf_CPPFLAGS = $(AM_CPPFLAGS)     \
                 $(GETTEXT)         \
                 -I../../libs/parser
nconf_LDADD = ${ncurses_LIBS} ${ncurses_extra_LIBS} \
              ../../libs/parser/libkconfigparser.la
