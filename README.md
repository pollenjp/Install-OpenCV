# Install-OpenCV


## Installation

```
 % make install-opencv \
    OPENCV_VERSION=4.1.0 \
    OPENCV_LIBS=static \
    OS_VERSION=ubuntu16.04
```

```
 % make install-opencv \
    OPENCV_VERSION=4.1.0 \
    OPENCV_LIBS=static \
    OS_VERSION=ubuntu18.04
```

- Checked `OPENCV_VERSION`
    - 4.1.0
    - 4.0.1
    - 3.4.5

---


## OpenCVのバージョンチェック

```
 % make OPENCV_VERSION=4.0.1 OPENCV_LIBS=static
make main
make[1]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Install-OpenCV' に入ります
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Install-OpenCV' に入ります
make[2]: 'check' に対して行うべき事はありません.
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Install-OpenCV' から出ます
g++ -g -Wall -std=c++11  check-opencv-version.cpp  `PKG_CONFIG_PATH=/home/pollenjp/.opencv/install/OpenCV-4.0.1/lib/pkgconfig pkg-config --cflags opencv4`  `PKG_CONFIG_PATH=/home/pollenjp/.opencv/install/OpenCV-4.0.1/lib/pkgconfig pkg-config --static --libs opencv4` -c -o check-opencv-version.o
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Install-OpenCV' に入ります
make[2]: 'check' に対して行うべき事はありません.
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Install-OpenCV' から出ます
g++ -g -Wall -std=c++11     check-opencv-version.o  `PKG_CONFIG_PATH=/home/pollenjp/.opencv/install/OpenCV-4.0.1/lib/pkgconfig pkg-config --static --libs opencv4` -o main
make[1]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Install-OpenCV' から出ます
./main
OpenCV version   : 4.0.1
Major version    : 4
Minor version    : 0
Subminor version : 1
```


```
 % ldd main 
	linux-vdso.so.1 =>  (0x00007ffd36bdc000)
	libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f0b27a28000)
	libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f0b27812000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f0b27448000)
	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f0b2713f000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f0b27daa000)
```

## Caution

### 4.1.0 - ubuntu18.04

__`${HOME}/.opencv/install/OpenCV-${OPENCV_VERSION}/${OPENCV_LIBS}/lib/pkgconfig/opencv4.pc`__ にあるファイルを以下のように変更する必要がある.
具体的には `-lgflags_shared` を削除

```
...
...
#Libs.private: -L${exec_prefix}/lib/opencv4/3rdparty -littnotify -llibprotobuf -llibwebp -lIlmImf -lquirc -lippiw -lippicv -L/usr/lib/x86_64-linux-gnu -ltbb -L/home/pollenjp/.opencv/opencv/build/lib -lade -lQt5Test -lQt5Concurrent -lQt5OpenGL -lpng -ltiff -ljasper -ljpeg -lQt5Core -lQt5Gui -lQt5Widgets -lfreetype -lharfbuzz -L/usr/lib/x86_64-linux-gnu/hdf5/serial -lhdf5 -lpthread -lsz -lz -ldl -lm -lcorrespondence -lmultiview -lnumeric -lglog -lgflags_shared -lrt -lGL -lGLU
Libs.private: -L${exec_prefix}/lib/opencv4/3rdparty -littnotify -llibprotobuf -llibwebp -lIlmImf -lquirc -lippiw -lippicv -L/usr/lib/x86_64-linux-gnu -ltbb -L/home/pollenjp/.opencv/opencv/build/lib -lade -lQt5Test -lQt5Concurrent -lQt5OpenGL -lpng -ltiff -ljasper -ljpeg -lQt5Core -lQt5Gui -lQt5Widgets -lfreetype -lharfbuzz -L/usr/lib/x86_64-linux-gnu/hdf5/serial -lhdf5 -lpthread -lsz -lz -ldl -lm -lcorrespondence -lmultiview -lnumeric -lglog -lrt -lGL -lGLU
...
...
```