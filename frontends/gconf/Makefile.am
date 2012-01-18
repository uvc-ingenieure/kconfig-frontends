bin_PROGRAMS = gconf

gconf_SOURCES = gconf.c gconf.glade
dist_EXTRA_gconf_SOURCES = images.c
gconf_CPPFLAGS = $(AM_CPPFLAGS) \
                 $(GETTEXT)     \
                 -I../../parser \
                 -DGUI_PATH='"$(pkgdatadir)/gconf.glade"'
gconf_CFLAGS = $(AM_CFLAGS) \
               $(gtk_CFLAGS)
gconf_LDADD = $(gtk_LIBS)                   \
              ../../parser/libkconfigparser.a
gconfdir = $(pkgdatadir)
gconf_DATA = gconf.glade
