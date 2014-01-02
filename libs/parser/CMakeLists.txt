find_package(GPERF REQUIRED)
find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)
find_package(LibIntl REQUIRED)
find_package(LibRegex REQUIRED)

include_directories(
	.
	${CMAKE_CURRENT_BINARY_DIR}
	${LibIntl_INCLUDE_DIRS}
	${LibRegex_INCLUDE_DIRS}
	${LibPDCurses_INCLUDE_DIRS}
)

gperf_target(hconf
  hconf.gperf
  ${CMAKE_CURRENT_BINARY_DIR}/hconf.c
  COMPILE_FLAGS "-a -C -E -g -k 1,3,$$ -p -t")
add_custom_target(hconftarget ALL DEPENDS hconf.c)

flex_target(lconf lconf.l ${CMAKE_CURRENT_BINARY_DIR}/lconf.c)
add_custom_target(lconftarget ALL DEPENDS lconf.c)

bison_target(yconf
  ${CMAKE_CURRENT_SOURCE_DIR}/yconf.y
  ${CMAKE_CURRENT_BINARY_DIR}/yconf.y.c
  COMPILE_FLAGS "-y -t -l -p zconf")

add_definitions(-DROOTMENU=\"RootMenu\")

add_library(kparser
  ${BISON_yconf_OUTPUTS}
)

add_dependencies(kparser hconftarget lconftarget)

if (WIN32)
  set(kparser_LIBRARIES
    kparser
    ${LibIntl_LIBRARY}
    ${LibRegex_LIBRARY}
	${LibPDCurses_LIBRARY}
    CACHE INTERNAL ""
  )
else ()
  set(kparser_LIBRARIES
    kparser
    CACHE INTERNAL ""
  )
endif ()

set(kparser_INCLUDE_DIRS
  "${CMAKE_CURRENT_SOURCE_DIR}"
  CACHE INTERNAL ""
)
