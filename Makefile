SHELL := /bin/bash

#===============================================================================
OPENCV_VERSION := 4.0.1
# "static" or "shared"
OPENCV_LIB := static

#===============================================================================
INC :=
LDLIBS  :=
OBJECTS := $(patsubst %.cpp,%.o,$(wildcard *.cpp))
TARGET := main

#===============================================================================
PKG_CONFIG_PATH := ${HOME}/.opencv/install/OpenCV-${OPENCV_VERSION}/lib/pkgconfig
#=======================================
# v4.*
ifneq ($(shell echo ${OPENCV_VERSION} | grep -E "4\.[0-9]+\.[0-9]+"), )
INC += `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --cflags opencv4`
# Select `static` or 'shared' OPENCV LIB 
# --static : static library (.a)
ifeq (${OPENCV_LIB}, shared)
LDLIBS += `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --libs opencv4`
else ifeq (${OPENCV_LIB}, static)
LDLIBS += `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --static --libs opencv4`
else
ERROR_MESSAGE := 'OPENCV_LIB' variable should be 'static' or 'shared'.
$(error "${ERROR_MESSAGE}")
endif
#=======================================
# v3.*
else ifneq ($(shell echo ${OPENCV_VERSION} | grep -E "3\.[0-9]+\.[0-9]+"), )
INC += `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --cflags opencv`
# Select `static` or 'shared' OPENCV LIB 
ifeq (${OPENCV_LIB}, shared)
LDLIBS += `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --libs opencv`
else ifeq (${OPENCV_LIB}, static)
LDLIBS += `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --static --libs opencv`
else
ERROR_MESSAGE := 'OPENCV_LIB' variable should be 'static' or 'shared'.
$(error "${ERROR_MESSAGE}")
endif
#=======================================
# Others
else
ERROR_MESSAGE := 'OPENCV_VERSION' variable (${OPENCV_VERSION}) is not supported.
$(error "${ERROR_MESSAGE}")
endif

#===============================================================================
CXX := g++
CXXFLAGS = -g -Wall -std=c++11
LINK.cc := $(CXX) $(CXXFLAGS) $(CPPFLAGS) ${LDFLAGS} $(TARGET_ARCH)
export

#===============================================================================
.DEFAULT_GOAL := run

.PHONY : debug
debug:
	echo ${INC}
	echo ${LDLIBS}

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
# INSTALL
.PHONY : install-opencv 
install-opencv : ## install OPENCV
	@${MAKE} check
	OPENCV_VERSION=${OPENCV_VERSION} ./install-opencv.bash.sh


