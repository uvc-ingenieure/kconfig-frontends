dist_bin_SCRIPTS =  tweak diff merge
dist_bin_SCRIPTS += streamline

if COND_utils_gettext
    MAYBE_utils_gettext = gettext
endif
bin_PROGRAMS = $(MAYBE_utils_gettext)

gettext_SOURCES = gettext.c
gettext_CPPFLAGS = $(AM_CPPFLAGS)   \
                   -I$(top_srcdir)/libs/parser
gettext_CFLAGS = $(AM_CFLAGS) $(kf_CFLAGS)
gettext_LDADD = $(top_builddir)/libs/parser/libkconfig-parser.la    \
                $(intl_LIBS)
