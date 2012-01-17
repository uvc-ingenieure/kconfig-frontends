noinst_LIBRARIES = liblxdialog.a

liblxdialog_a_SOURCES = \
    checklist.c         \
    dialog.h            \
    inputbox.c          \
    menubox.c           \
    textbox.c           \
    util.c              \
    yesno.c

liblxdialog_a_CPPFLAGS = $(AM_CPPFLAGS)                   \
                         -DCURSES_LOC='"${CURSES_LOC}"'   \
                         $(GETTEXT)
