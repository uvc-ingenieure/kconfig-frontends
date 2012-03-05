bin_PROGRAMS = qconf

qconf_SOURCES = qconf.cc qconf.h
BUILT_SOURCES = qconf.moc
qconf_CPPFLAGS = $(AM_CPPFLAGS)         \
                 $(GETTEXT)             \
                 -I../../libs/parser    \
                 -I../../libs/images
qconf_CXXFLAGS = $(AM_CXXFLAGS) \
                 $(qt4_CFLAGS)
qconf_LDADD = ../../libs/parser/libkconfigparser.la \
              $(qt4_LIBS) $(qconf_EXTRA_LIBS)

.h.moc:
	moc -i $< -o $@
