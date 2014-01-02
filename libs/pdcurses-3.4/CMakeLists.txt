include_directories(.)

add_subdirectory(win32)
add_subdirectory(pdcurses)

set(pdcurses_LIBRARIES
  pdcurses
  pdcurses-win32
  CACHE INTERNAL ""
)

set(pdcurses_INCLUDE_DIRS
  "${CMAKE_CURRENT_SOURCE_DIR}"
  CACHE INTERNAL ""
)