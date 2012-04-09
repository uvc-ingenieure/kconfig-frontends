bin_PROGRAMS = kconfig-gconf

kconfig_gconf_SOURCES = gconf.c gconf.glade
kconfig_gconf_CPPFLAGS = $(AM_CPPFLAGS)                 \
                         $(GETTEXT)                     \
                         -I$(top_srcdir)/libs/parser    \
                         -I$(top_builddir)/libs/images  \
                         -DGUI_PATH='"$(pkgdatadir)/gconf.glade"'
kconfig_gconf_CFLAGS = $(AM_CFLAGS) \
                       $(kf_CFLAGS) \
                       $(gtk_CFLAGS)
kconfig_gconf_LDADD = $(top_builddir)/libs/parser/libkconfig-parser.la  \
                      $(top_builddir)/libs/images/libkconfig-images.a   \
                      $(gtk_LIBS) $(gconf_EXTRA_LIBS)
kconfig_gconfdir = $(pkgdatadir)
kconfig_gconf_DATA = gconf.glade
