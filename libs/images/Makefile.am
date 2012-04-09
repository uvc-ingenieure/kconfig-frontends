noinst_LIBRARIES = libimages.a

libimages_a_SOURCES = images.c_orig
nodist_libimages_a_SOURCES = images.c
BUILT_SOURCES = images.c images.h
CLEANFILES = images.c images.h

images.c: images.c_orig
	$(SED) -r -e 's/^static //' $< >$@

images.h: images.c_orig
	$(SED) -r -e '/^static (const char \*xpm_(.+)\[\]) = \{/!d; s//extern \1;/' \
	       $< >$@
