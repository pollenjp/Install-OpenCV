# CMakeでbuildする場合

versionチェックのbuildをする

```shell
user@localpc%
cd byCMake
user@localpc%
mkdir build && cd build
user@localpc%
cmake \
  -DOPENCV_VERSION=4.1.0 \
  -DOPENCV_PKG_CONFIG_PATH=${HOME}/.opencv/install/OpenCV-4.1.0/static/lib/pkgconfig \
  ..
user@localpc%
make
user@localpc%
./check-opencv-version 
OpenCV version   : 4.1.0
Major version    : 4
Minor version    : 1
Subminor version : 0

````