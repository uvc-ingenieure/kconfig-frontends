bin_PROGRAMS = conf

conf_SOURCES = conf.c
conf_CPPFLAGS = $(AM_CPPFLAGS)  \
                $(GETTEXT)      \
                -I$(top_srcdir)/libs/parser
conf_LDADD = $(top_builddir)/libs/parser/libkconfigparser.la  \
             $(conf_EXTRA_LIBS)
