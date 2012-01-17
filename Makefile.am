SUFFIXES = .gperf

bin_PROGRAMS = conf nconf mconf

conf_SOURCES =  \
    conf.c      \
    yconf.y

mconf_SOURCES = \
    mconf.c     \
    yconf.y
mconf_CFLAGS = -DCURSES_LOC='"${CURSES_LOC}"'
mconf_LDADD = lxdialog/liblxdialog.a

nconf_SOURCES = \
    nconf.c     \
    nconf.gui.c \
    yconf.y
nconf_LDADD = -lmenu -lpanel

yconf.o: lconf.c hconf.c

.gperf.c:
	$(GPERF) -t --output-file $@ -a -C -E -g -k 1,3,$$ -p -t $<

.l.c:
	$(LEX) $(LFLAGS) $(AM_LFLAGS) -o$@ $<

SUBDIRS = lxdialog .
