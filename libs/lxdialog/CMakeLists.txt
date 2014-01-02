find_package(LibIntl REQUIRED)

if (WIN32)
    set(lxdialog_INCLUDE_DIRS
	"${CMAKE_CURRENT_SOURCE_DIR}"
	${pdcurses_INCLUDE_DIRS}
	CACHE INTERNAL ""
    )
    set(lxdialog_DEFINES "-DCURSES_LOC=\"curses.h\"" CACHE INTERNAL "")
    set(CURSES_LIBRARIES ${pdcurses_LIBRARIES})

else ()
    find_package(Curses)
    set(lxdialog_INCLUDE_DIRS
	"${CMAKE_CURRENT_SOURCE_DIR}"
	${CURSES_INCLUDE_DIR}
	CACHE INTERNAL ""
    )

    if (${CURSES_HAVE_NCURSES_H})
	set(lxdialog_DEFINES "-DCURSES_LOC=\"ncurses.h\"" CACHE INTERNAL "")
    else (${CURSES_HAVE_NCURSES_H})
	set(lxdialog_DEFINES "-DCURSES_LOC=\"curses.h\"" CACHE INTERNAL "")
    endif (${CURSES_HAVE_NCURSES_H})

endif ()

message("INCLUDE DIRS: ${lxdialog_INCLUDE_DIRS}")

add_definitions(${lxdialog_DEFINES})
include_directories(
	${lxdialog_INCLUDE_DIRS}
	${LibIntl_INCLUDE_DIRS}
)

add_library(lxdialog
    checklist.c
    inputbox.c
    menubox.c
    textbox.c
    util.c
    yesno.c
)

target_link_libraries(lxdialog
    ${CURSES_LIBRARIES}
)

set(lxdialog_LIBRARIES
    lxdialog
    ${CURSES_LIBRARIES}
    CACHE INTERNAL ""
)
