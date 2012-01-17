bin_PROGRAMS = nconf

nconf_SOURCES = nconf.c nconf.gui.c nconf.h
nconf_CPPFLAGS = $(AM_CPPFLAGS) \
                 $(GETTEXT)     \
                 -I../../parser
nconf_LDADD = ../../parser/libkconfigparser.a -lmenu -lpanel
