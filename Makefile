SHELL:=/bin/bash

OPENCV_VERSION :=
ERROR_MESSAGE :=

CC := g++
CXXFLAGS = -g -Wall -std=c++11

# [gcc -l -L option flags for library link](https://www.rapidtables.com/code/linux/gcc/gcc-l.html)
# [gcc -I option flag (include directory)](https://www.rapidtables.com/code/linux/gcc/gcc-i.html)
INC := ${HOME}/.opencv/install/OpenCV-${OPENCV_VERSION}/include/opencv4
INC := $(addprefix -I,${INC})
LDLIBS1 :=
LDLIBS2 :=
LDLIBS := $(addprefix -L,${LDLIBS1}) $(addprefix -l,${LDLIBS2})
LINK.cc := $(CXX) $(CXXFLAGS) $(CPPFLAGS) ${LDFLAGS} $(TARGET_ARCH)

OBJECTS := $(patsubst %.cpp,%.o,$(wildcard *.cpp))
TARGET := check
export

.DEFAULT_GOAL := run

.PHONY : run
run :
	${MAKE} ${TARGET}
	./${TARGET}

%.o : %.cpp
	@$(MAKE) preprocess
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $^ ${INC} ${LDLIBS} -c -o $@

${TARGET} : ${OBJECTS}
	@$(MAKE) preprocess
	$(LINK.cc) $(TARGET_ARCH) $^ ${LDLIBS} -o $@

#===============================================================================
.PHONY : preprocess
preprocess :
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
	@${MAKE} preprocess
	OPENCV_VERSION=${OPENCV_VERSION} ./install-opencv.bash.sh


