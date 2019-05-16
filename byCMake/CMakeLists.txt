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

add_executable(#[[ <name>  ]] check-opencv-version
               #[[ source1 ]] check-opencv-version.cpp)

include(#[[<file|module>]] ${CMAKE_CURRENT_SOURCE_DIR}/cmake-modules/FindOpenCV.cmake)

# PKG_OPENCV_LDFLAGS
# [pkg config - set PKG_CONFIG_PATH in cmake - Stack Overflow](https://stackoverflow.com/a/44489201/9316234)
target_link_libraries(#[[ <target> ]] check-opencv-version
                      #[[ <item>   ]] ${PKG_OPENCV_LDFLAGS})

