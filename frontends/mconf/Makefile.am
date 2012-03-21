bin_PROGRAMS = mconf

mconf_SOURCES = mconf.c
mconf_CPPFLAGS = $(AM_CPPFLAGS)                 \
                 -DCURSES_LOC='"$(CURSES_LOC)"' \
                 $(GETTEXT)                     \
                 -I$(top_srcdir)/libs                   \
                 -I$(top_srcdir)/libs/parser
mconf_LDADD = $(top_builddir)/libs/parser/libkconfigparser.la \
              $(top_builddir)/libs/lxdialog/liblxdialog.a     \
              $(ncurses_LIBS) $(mconf_EXTRA_LIBS)
