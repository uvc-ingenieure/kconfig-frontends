bin_PROGRAMS = mconf

mconf_SOURCES = mconf.c
mconf_CPPFLAGS = $(AM_CPPFLAGS)                 \
                 -DCURSES_LOC='"${CURSES_LOC}"' \
                 $(GETTEXT)                     \
                 -I../../parser
mconf_LDADD = ../../parser/libkconfigparser.a ../../lxdialog/liblxdialog.a
