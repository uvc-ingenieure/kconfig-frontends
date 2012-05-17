dist_bin_SCRIPTS =  tweak diff merge
dist_bin_SCRIPTS += streamline
bin_PROGRAMS = gettext

gettext_SOURCES = gettext.c
gettext_CPPFLAGS = $(AM_CPPFLAGS)   \
                   -I$(top_srcdir)/libs/parser
gettext_CFLAGS = $(AM_CFLAGS) $(kf_CFLAGS)
gettext_LDADD = $(top_builddir)/libs/parser/libkconfig-parser.la    \
                $(intl_LIBS)
