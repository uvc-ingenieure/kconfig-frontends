add_library(images
  images.c
)

set(images_LIBRARIES
  images
  CACHE INTERNAL ""
)

set(images_INCLUDE_DIRS
  "${CMAKE_CURRENT_SOURCE_DIR}"
  CACHE INTERNAL ""
)
