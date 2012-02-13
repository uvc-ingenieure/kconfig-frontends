bin_PROGRAMS = conf

conf_SOURCES = conf.c
conf_CPPFLAGS = $(AM_CPPFLAGS)  \
                $(GETTEXT)      \
                -I../../libs/parser
conf_LDADD = ../../libs/parser/libkconfigparser.la
