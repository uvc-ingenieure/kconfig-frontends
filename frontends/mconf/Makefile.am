bin_PROGRAMS = kconfig-mconf

kconfig_mconf_SOURCES = mconf.c
kconfig_mconf_CPPFLAGS = $(AM_CPPFLAGS)                 \
                         -DCURSES_LOC='"$(CURSES_LOC)"' \
                         $(GETTEXT)                     \
                         -I$(top_srcdir)/libs           \
                         -I$(top_srcdir)/libs/parser
kconfig_mconf_CFLAGS = $(AM_CFLAGS) \
                       $(kf_CFLAGS)
kconfig_mconf_LDADD = $(top_builddir)/libs/parser/libkconfig-parser.la      \
                      $(top_builddir)/libs/lxdialog/libkconfig-lxdialog.a   \
                      $(ncurses_LIBS) $(mconf_EXTRA_LIBS)
