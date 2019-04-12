SHELL := /bin/bash

OS_VERSION :=
OPENCV_VERSION := 4.0.1
INC :=
LDLIBS  :=
OBJECTS := $(patsubst %.cpp,%.o,$(wildcard *.cpp))
TARGET := main

#===============================================================================
# v4.0.1
ifeq (${OPENCV_VERSION}, 4.0.1)
PKG_CONFIG_PATH := ${HOME}/.opencv/install/OpenCV-${OPENCV_VERSION}/lib/pkgconfig
INC := ${INC} `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --cflags opencv4`
# --static : static library (.a)
LDLIBS  := ${LDLIBS} `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --static --libs opencv4`
endif
#===============================================================================
ifeq (${OPENCV_VERSION}, 3.4.5)
PKG_CONFIG_PATH := ${HOME}/.opencv/install/OpenCV-${OPENCV_VERSION}/lib/pkgconfig
INC := ${INC} `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --cflags opencv`
# --static : static library (.a)
LDLIBS := ${LDLIBS} `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --static --libs opencv`
endif

#===============================================================================
CXX := g++
CXXFLAGS = -g -Wall -std=c++11
LINK.cc := $(CXX) $(CXXFLAGS) $(CPPFLAGS) ${LDFLAGS} $(TARGET_ARCH)
export

#===============================================================================
.DEFAULT_GOAL := run

.PHONY : run
run :
	${MAKE} ${TARGET}
	./${TARGET}

%.o : %.cpp
	@$(MAKE) check
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $^ ${INC} ${LDLIBS} -c -o $@

${TARGET} : ${OBJECTS}
	@$(MAKE) check
	$(LINK.cc) $(TARGET_ARCH) $^ ${LDLIBS} -o $@

#===============================================================================
.PHONY : check
check :
# [Bash - adding color - NoskeWiki printf zsh](http://www.andrewnoske.com/wiki/Bash_-_adding_color)
ifndef OPENCV_VERSION
	@printf "\e[101m Variable OPENCV_VERSION does not set. \e[0m \n"
	@${MAKE} error ERROR_MESSAGE="OPENCV_VERSION"
endif

.PHONY : error
error :  ## errors処理を外部に記述することで好きなエラーメッセージをprintfで記述可能.
	$(error "${ERROR_MESSAGE}")

.PHONY : clean
clean :
	-${RM} ${TARGET} ${OBJECTS} *~ .*~ core

#===============================================================================
# Ubuntu Dependency
.PHONY : ubuntu16.04
ubuntu16.04 :
	./dependency-ubuntu16.04.bash.sh

.PHONY : ubuntu18.04
ubuntu18.04 :
	./dependency-ubuntu18.04.bash.sh

# INSTALL
.PHONY : install-opencv 
install-opencv : ## install OPENCV
ifndef OS_VERSION
	@printf "\e[101m Variable OS_VERSION does not set. \e[0m \n"
	@${MAKE} error ERROR_MESSAGE="OS_VERSION"
endif
	${MAKE} ${OS_VERSION}
	@${MAKE} check
	OPENCV_VERSION=${OPENCV_VERSION} ./install-opencv.bash.sh


