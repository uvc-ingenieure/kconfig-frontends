bin_PROGRAMS = gconf

gconf_SOURCES = gconf.c gconf.glade
gconf_CPPFLAGS = $(AM_CPPFLAGS)         \
                 $(GETTEXT)             \
                 -I../../libs/parser    \
                 -I../../libs/images    \
                 -DGUI_PATH='"$(pkgdatadir)/gconf.glade"'
gconf_CFLAGS = $(AM_CFLAGS) \
               $(gtk_CFLAGS)
gconf_LDADD = ../../libs/parser/libkconfigparser.la \
              $(gtk_LIBS)
gconfdir = $(pkgdatadir)
gconf_DATA = gconf.glade
