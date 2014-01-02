find_package(Curses REQUIRED)
find_package(LibIntl REQUIRED)
add_definitions(${lxdialog_DEFINES})

include_directories(
    ${kparser_INCLUDE_DIRS}
    ${lxdialog_INCLUDE_DIRS}
)

include_directories(
	${CURSES_INCLUDE_DIRS}
	${LibIntl_INCLUDE_DIRS}
)

set(TARGET_NAME kconfig-mconf)

add_executable(${TARGET_NAME}
  mconf.c
)

target_link_libraries(${TARGET_NAME}
  ${kparser_LIBRARIES}
  ${lxdialog_LIBRARIES}
  ${CURSES_NCURSES_LIBRARIES}
)

set(EXECUTABLE "${EXECUTABLE_OUTPUT_PATH}/${TARGET_NAME}${CMAKE_EXECUTABLE_SUFFIX}")

if (WIN32)
    get_filename_component(MINGW_PATH "${CMAKE_C_COMPILER}" PATH)
endif ()

# install(TARGETS mconf DESTINATION ${BIN_INSTALL_DIR})
install(CODE "
   include(BundleUtilities)
   fixup_bundle(\"${EXECUTABLE}\"   \"\"   \"\")
   " COMPONENT Runtime)

install(TARGETS ${TARGET_NAME} DESTINATION ${BIN_INSTALL_DIR})
