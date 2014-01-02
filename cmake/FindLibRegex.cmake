# Try to find the libregex library. Explicit searching is currently
# only required for Win32, though it might be useful for some UNIX
# variants, too. Therefore code for searching common UNIX include
# directories is included, too.
#
# Once done this will define
#
#  LIBREGEX_FOUND - system has libregex
#  LIBREGEX_LIBRARIES - the library needed for linking

IF (LibRegex_LIBRARY)
   SET(LibRegex_FIND_QUIETLY TRUE)
ENDIF ()

# for Windows we rely on the environement variables
# %INCLUDE% and %LIB%; FIND_LIBRARY checks %LIB%
# automatically on Windows
IF(WIN32)
    FIND_LIBRARY(LibRegex_LIBRARY
        NAMES regex
    )
ELSE()
    FIND_LIBRARY(LibRegex_LIBRARY
        NAMES intl
        PATHS /usr/lib /usr/local/lib
    )
ENDIF()

IF (LibRegex_LIBRARY)
    SET(LIBREGEX_FOUND TRUE)
    SET(LIBREGEX_LIBRARIES ${LibRegex_LIBRARY})
ELSE ()
    SET(LIBREGEX_FOUND FALSE)
ENDIF ()

IF (LIBREGEX_FOUND)
    IF (NOT LibRegex_FIND_QUIETLY)
        MESSAGE(STATUS "Found libregex: ${LibRegex_LIBRARY}")
    ENDIF ()
ELSE ()
    IF (LibRegex_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could NOT find libregex")
    ENDIF ()
ENDIF ()

MARK_AS_ADVANCED(LibRegex_LIBRARY)
