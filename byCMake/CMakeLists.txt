#
# 

# CMakeのバージョンを設定
# block comment (>=3.0)
# `CMAKE_CXX_STANDARD` variable (>=3.1)
cmake_minimum_required(VERSION 3.1)

# プロジェクト名と使用する言語を設定
project(#[[<PROJECT-NAME>]] check-opencv-version
        #[[ [LANGUAGES]  ]] CXX)

# all targets
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -Wall -O0")

## 最適化・警告等のオプション
#target_compile_options(#[[ <target> ]] check-opencv-version
#                       #[[ <INTERFACE|PUBLIC|PRIVATE> ]] PUBLIC
#                       #[[ [items1...] ]] -Wall -O0 -g)
## C++11/14/17
## https://cmake.org/cmake/help/v3.8/manual/cmake-compile-features.7.html#requiring-language-standards
#target_compile_features(#[[ <target> ]] check-opencv-version
#                        #[[ <INTERFACE|PUBLIC|PRIVATE> ]] PUBLIC
#                        #[[ [items1...] ]] cxx_std_11)

option(#[[ <option_variable> ]] OPENCV_VERSION
       #[[ "help string describing option" ]] "OpenCV PKG_CONFIG_PATH '<PATH>' or 'OFF'"
       #[[ [initial value] ]] OFF)
option(#[[ <option_variable> ]] OPENCV_PKG_CONFIG_PATH
       #[[ "help string describing option" ]] "OpenCV PKG_CONFIG_PATH '<PATH>' or 'OFF'"
       #[[ [initial value] ]] OFF)
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

add_executable(#[[ <name>  ]] check-opencv-version
               #[[ source1 ]] check-opencv-version.cpp)

target_link_libraries(#[[ <target> ]] check-opencv-version
                      #[[ <item> ]] ${PKG_OPENCV_LDFLAGS})

