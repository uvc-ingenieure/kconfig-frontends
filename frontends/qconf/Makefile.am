bin_PROGRAMS = qconf

qconf_SOURCES = qconf.cc qconf.h
dist_EXTRA_qconf_SOURCES = images.c
BUILT_SOURCES = qconf.moc
qconf_CPPFLAGS = $(AM_CPPFLAGS)     \
                 $(GETTEXT)         \
                 -I../../libs/parser
qconf_CXXFLAGS = $(AM_CXXFLAGS) \
                 $(qt4_CFLAGS)
qconf_LDADD = $(qt4_LIBS)                           \
              ../../libs/parser/libkconfigparser.a

.h.moc:
	moc -i $< -o $@
