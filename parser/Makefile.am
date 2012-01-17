SUFFIXES = .gperf

noinst_LIBRARIES = libkconfigparser.a

libkconfigparser_a_SOURCES = yconf.y
dist_EXTRA_libkconfigparser_a_SOURCES =   \
    hconf.gperf lconf.l                   \
    confdata.c menu.c symbol.c util.c     \
    expr.c expr.h lkc.h lkc_proto.h

BUILT_SOURCES = hconf.c lconf.c

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
