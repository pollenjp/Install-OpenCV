# Variable defined in this file
#   - OPENCV_VERSION
#   - OPENCV_PKG_CONFIG_PATH
#   - PKG_OPENCV

option(#[[ <option_variable> ]] OPENCV_VERSION
       #[[ "help string"     ]] "OpenCV PKG_CONFIG_PATH '<PATH>' or 'OFF'"
       #[[ [initial value]   ]] OFF)
option(#[[ <option_variable> ]] OPENCV_PKG_CONFIG_PATH
       #[[ "help string"     ]] "OpenCV PKG_CONFIG_PATH '<PATH>' or 'OFF'"
       #[[ [initial value]   ]] OFF)

# [How to specify the variable which must be set and exist in cmake - Stack Overflow](https://stackoverflow.com/a/39617079/9316234)
if (OPENCV_VERSION STREQUAL "OFF")
  message(#[[ [<mode>] ]] FATAL_ERROR
          #[["message to display"]] "You must set 'OPENCV_VERSION' macro. (EX: '-DOPENCV_VERSION=4.1.0')")
endif()

#set(PKG_CONFIG_PATH ${PKG_CONFIG_PATH} ${OPENCV_PKG_CONFIG_PATH})
set(ENV{PKG_CONFIG_PATH} "${OPENCV_PKG_CONFIG_PATH}:$ENV{PKG_CONFIG_PATH}")

# [pkg config - set PKG_CONFIG_PATH in cmake - Stack Overflow](https://stackoverflow.com/questions/44487053/set-pkg-config-path-in-cmake)
find_package(PkgConfig REQUIRED)

# [CMake express the "greater or equal" statement - Stack Overflow](https://stackoverflow.com/a/16668344)
# opencv version 4 or not
if (OPENCV_VERSION GREATER_EQUAL 4.0.0)
  pkg_check_modules(PKG_OPENCV REQUIRED opencv4)
else()
  pkg_check_modules(PKG_OPENCV REQUIRED opencv)
endif()

include_directories(${PKG_OPENCV_INCLUDE_DIRS})
