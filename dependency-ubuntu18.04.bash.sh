#!/bin/bash -eux

# [Install OpenCV 4 on Ubuntu 16.04 (C++ and Python) | Learn OpenCV](https://www.learnopencv.com/install-opencv-4-on-ubuntu-16-04/)
# [memo on hackmd.io](https://hackmd.io/MVHtNQarSouT_b9H9yAa_w)
# [OpenCV: Installation in Linux](https://docs.opencv.org/4.0.1/d7/d9f/tutorial_linux_install.html)

#===============================================================================
# ref : [command line - how to check if PPA is already added to apt sources list in a bash script - Ask Ubuntu](https://askubuntu.com/a/561628/807051)
the_ppa="deb http://security.ubuntu.com/ubuntu xenial-security main"
# [bashの変数内文字列置換まとめ - Qiita](https://qiita.com/aosho235/items/c36568830a8d47288284#dirname)
if ! grep -q "^${the_ppa// /\ }" /etc/apt/sources.list /etc/apt/sources.list.d/*; then sudo add-apt-repository ""
    sudo add-apt-repository ${the_ppa}
fi
sudo apt update

## Install dependencies
# [compiler]
sudo apt -y install build-essential
# [required]
sudo apt -y install \
                    cmake git libgtk2.0-dev pkg-config \
                    libavcodec-dev libavformat-dev libswscale-dev
# [optional]
sudo apt -y install \
                    python-dev \
                    python-numpy \
                    libtbb2 libtbb-dev \
                    libjpeg-dev \
                    libpng-dev \
                    libtiff-dev \
                    libjasper-dev \
                    libdc1394-22-dev

sudo apt -y install \
                    checkinstall \
                    yasm \
                    gfortran \
                    libdc1394-22-dev \
                    libxine2-dev \
                    libv4l-dev
sudo apt -y install \
                    libgstreamer1.0-dev \
                    libgstreamer-plugins-base1.0-dev
sudo apt -y install \
                    libgtk2.0-dev \
                    libtbb-dev \
                    qt5-default \
                    libatlas-base-dev \
                    libfaac-dev \
                    libmp3lame-dev \
                    libtheora-dev \
                    libvorbis-dev \
                    libxvidcore-dev \
                    libopencore-amrnb-dev \
                    libopencore-amrwb-dev \
                    libavresample-dev \
                    x264 v4l-utils
# Optional dependencies
sudo apt -y install libprotobuf-dev protobuf-compiler
sudo apt -y install libgoogle-glog-dev libgflags-dev
sudo apt -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen