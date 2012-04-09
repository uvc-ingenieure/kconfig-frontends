dist_bin_SCRIPTS =  kconfig-tweak kconfig-diff kconfig-merge
dist_bin_SCRIPTS += kconfig-streamline
bin_PROGRAMS = kconfig-gettext

kconfig_gettext_SOURCES = kconfig-gettext.c
kconfig_gettext_CPPFLAGS = $(AM_CPPFLAGS)   \
                           -I$(top_srcdir)/libs/parser
kconfig_gettext_CFLAGS = $(AM_CFLAGS) $(kf_CFLAGS)
kconfig_gettext_LDADD = $(top_builddir)/libs/parser/libkconfig-parser.la
