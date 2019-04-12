#!/bin/bash -eux

# [OpenCV: Installation in Linux](https://docs.opencv.org/4.0.1/d7/d9f/tutorial_linux_install.html)
# [Install OpenCV 4 on Ubuntu 16.04 (C++ and Python) | Learn OpenCV](https://www.learnopencv.com/install-opencv-4-on-ubuntu-16-04/)
# [memo on hackmd.io](https://hackmd.io/MVHtNQarSouT_b9H9yAa_w)

#=======================================
## Install dependencies
sudo apt -y install build-essential checkinstall cmake pkg-config yasm \
                    git gfortran \
                    libjpeg8-dev libjasper-dev libpng12-dev \
                    libtiff5-dev \
                    libtiff-dev \
                    libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev \
                    libxine2-dev libv4l-dev \
                    libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \
                    libgtk2.0-dev libtbb-dev qt5-default \
                    libatlas-base-dev \
                    libfaac-dev libmp3lame-dev libtheora-dev \
                    libvorbis-dev libxvidcore-dev \
                    libopencore-amrnb-dev libopencore-amrwb-dev \
                    libavresample-dev \
                    x264 v4l-utils
# Optional dependencies
sudo apt -y install libprotobuf-dev protobuf-compiler
sudo apt -y install libgoogle-glog-dev libgflags-dev
sudo apt -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen