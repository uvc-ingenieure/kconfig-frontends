bin_PROGRAMS = mconf

mconf_SOURCES = mconf.c
mconf_CPPFLAGS = $(AM_CPPFLAGS) -I../../parser -DCURSES_LOC='"${CURSES_LOC}"'
mconf_LDADD = ../../parser/libkconfigparser.a ../../lxdialog/liblxdialog.a
