bin_PROGRAMS = mconf

mconf_SOURCES = mconf.c
mconf_CPPFLAGS = $(AM_CPPFLAGS)                 \
                 -DCURSES_LOC='"${CURSES_LOC}"' \
                 $(GETTEXT)                     \
                 -I../../libs                   \
                 -I../../libs/parser
mconf_LDADD = ../../libs/parser/libkconfigparser.a  \
              ../../libs/lxdialog/liblxdialog.a
