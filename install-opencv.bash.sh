#!/bin/bash -eux
#OPENCV_VERSION=4.0.1
#NOTCLEAN  # flag : buildディレクトリルが存在していればそれを使う
OPENCV_DIR=${HOME}/.opencv
CMAKE_INSTALL_PREFIX=${OPENCV_DIR}/install/OpenCV-${OPENCV_VERSION}
# current working directory
CWD=$(pwd)



#=======================================
if [ ! -d ${OPENCV_DIR} ] && [ ! -L ${OPENCV_DIR} ]; then
  # if directory or symbolic link does not exist
  mkdir ${OPENCV_DIR}
fi

#=======================================
# opencv
cd ${OPENCV_DIR}
if [ ! -d "${OPENCV_DIR}/opencv" ]; then
  git clone https://github.com/opencv/opencv.git
fi

cd "${OPENCV_DIR}/opencv"
git checkout ${OPENCV_VERSION}
cd ..
 
#===================
# opencv_contrib
cd ${OPENCV_DIR}
if [ ! -d "${OPENCV_DIR}/opencv_contrib" ]; then
  git clone https://github.com/opencv/opencv_contrib.git
fi
cd "${OPENCV_DIR}/opencv_contrib"
git checkout ${OPENCV_VERSION}


#=======================================
directory1=${OPENCV_DIR}/opencv_contrib/build
if [ -d "${directory1}" ]; then
  rm -rf ${directory1}
fi
directory1=${OPENCV_DIR}/opencv/build
if [ -d "${directory1}" ]; then
  rm -rf ${directory1}
fi
mkdir ${directory1}
cd ${directory1}
echo ${directory1}

# [How to set C or C++ compiler for CMake – Code Yarns](https://codeyarns.com/2013/12/24/how-to-set-c-or-c-compiler-for-cmake/)
cmake \
      -D BUILD_SHARED_LIBS=OFF \
      -D CMAKE_C_COMPILER=/usr/bin/cc \
      -D CMAKE_CXX_COMPILER=/usr/bin/c++ \
      -D CMAKE_CXX_FLAGS="-std=c++11" \
      -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} \
      -D OPENCV_GENERATE_PKGCONFIG=YES \
      -D INSTALL_C_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON \
      ..
      #-D INSTALL_PYTHON_EXAMPLES=ON \
      #-D OPENCV_PYTHON3_INSTALL_PATH=$cwd/OpenCV-$cvVersion-py3/lib/python3.5/site-packages \

if [ -d "${CMAKE_INSTALL_PREFIX}" ]; then
  rm -rf ${CMAKE_INSTALL_PREFIX}
fi
make -j8
make install

#===============================================================================
#  Back to working directory
cd ${CWD}
