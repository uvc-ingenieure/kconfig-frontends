SUFFIXES = .gperf

lib_LTLIBRARIES = libkconfigparser.la
libkconfigparser_la_SOURCES = yconf.y
dist_EXTRA_libkconfigparser_la_SOURCES =  \
    hconf.gperf lconf.l                   \
    confdata.c menu.c symbol.c util.c     \
    expr.c expr.h lkc.h lkc_proto.h
libkconfigparser_la_CPPFLAGS = -DPACKAGE="\"$(package_name)\""  \
                               -DCONFIG_=\"$(config_prefix)\"
libkconfigparser_la_LDFLAGS = -release $(KCONFIGPARSER_LIB_VERSION)

include_HEADERS = expr.h lkc.h lkc_proto.h

BUILT_SOURCES = hconf.c lconf.c

# Can't use libkconfigparser_a_CPPFLAGS, as it breaks dependencies
yconf.o: CPPFLAGS+=$(GETTEXT)

.gperf.c:
	$(GPERF) -t --output-file $@ -a -C -E -g -k 1,3,$$ -p -t $<

# The following rule produces a warning:
#   parser/Makefile.am:31: user target `.l.c' defined here...
#  	/usr/share/automake-1.11/am/lex.am: ... overrides Automake target
#  	`.l.c' defined here
#
# This is expected, and can't be avoided (for now).
# That's because, when working with lex+yacc sources, the default is to
# build each files searately, and then link them together into the final
# output. But the Linux kernel's parser simply #include-s the lexer,
# so we can't put lconf.l into the _SOURCES (it's in EXTRA_SOURCES),
# and thus automake does not catch the need to call lex.
# Secondly, when flex is told to change the symbols' prefix (kconfig
# uses zconf in lieue of the original yy), then the output file is
# also renamed, but automake does not now that, and make would fail
# because it would think no file was generated.
.l.c:
	$(LEXCOMPILE) -o$@ $<
