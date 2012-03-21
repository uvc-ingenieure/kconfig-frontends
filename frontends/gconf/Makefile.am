bin_PROGRAMS = gconf

gconf_SOURCES = gconf.c gconf.glade
gconf_CPPFLAGS = $(AM_CPPFLAGS)         \
                 $(GETTEXT)             \
                 -I$(top_srcdir)/libs/parser    \
                 -I$(top_srcdir)/libs/images    \
                 -DGUI_PATH='"$(pkgdatadir)/gconf.glade"'
gconf_CFLAGS = $(AM_CFLAGS) \
               $(gtk_CFLAGS)
gconf_LDADD = $(top_builddir)/libs/parser/libkconfigparser.la \
              $(gtk_LIBS) $(gconf_EXTRA_LIBS)
gconfdir = $(pkgdatadir)
gconf_DATA = gconf.glade
