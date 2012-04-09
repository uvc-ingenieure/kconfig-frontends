bin_PROGRAMS = kconfig-conf

kconfig_conf_SOURCES = conf.c
kconfig_conf_CPPFLAGS = $(AM_CPPFLAGS)  \
                        $(GETTEXT)      \
                        -I$(top_srcdir)/libs/parser
kconfig_conf_CFLAGS = $(AM_CFLAGS) $(kf_CFLAGS)
kconfig_conf_LDADD = $(top_builddir)/libs/parser/libkconfig-parser.la  \
                     $(conf_EXTRA_LIBS)
