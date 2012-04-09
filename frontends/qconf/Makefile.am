bin_PROGRAMS = kconfig-qconf

kconfig_qconf_SOURCES = qconf.cc qconf.h
BUILT_SOURCES = qconf.moc
kconfig_qconf_CPPFLAGS = $(AM_CPPFLAGS)                 \
                         $(GETTEXT)                     \
                         -I$(top_srcdir)/libs/parser    \
                         -I$(top_builddir)/libs/images
kconfig_qconf_CXXFLAGS = $(AM_CXXFLAGS) \
                         $(kf_CFLAGS)   \
                         $(qt4_CFLAGS)
kconfig_qconf_LDADD = $(top_builddir)/libs/parser/libkconfig-parser.la  \
                      $(top_builddir)/libs/images/libkconfig-images.a   \
                      $(qt4_LIBS) $(qconf_EXTRA_LIBS)
CLEANFILES = qconf.moc

.h.moc:
	$(MOC) -i $< -o $@
