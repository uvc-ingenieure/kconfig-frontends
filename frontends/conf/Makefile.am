bin_PROGRAMS = conf

conf_SOURCES = conf.c
conf_CPPFLAGS = $(AM_CPPFLAGS)  \
                $(GETTEXT)      \
                -I../../parser
conf_LDADD = ../../parser/libkconfigparser.a
