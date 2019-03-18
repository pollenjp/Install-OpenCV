# install-OpenCV


## OpenCVのインストール

```
make install-opencv OPENCV_VERSION=4.0.1
```


## OpenCVのバージョンチェック

```
 % make OPENCV_VERSION=4.0.1
make check
make[1]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Learning_OpenCV/install-OpenCV' に入ります
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Learning_OpenCV/install-OpenCV' に入ります
make[2]: 'preprocess' に対して行うべき事はありません.
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Learning_OpenCV/install-OpenCV' から出ます
g++ -g -Wall -std=c++11  check-opencv-version.cpp -I/home/pollenjp/.opencv/install/OpenCV-4.0.1/include/opencv4   -c -o check-opencv-version.o
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Learning_OpenCV/install-OpenCV' に入ります
make[2]: 'preprocess' に対して行うべき事はありません.
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Learning_OpenCV/install-OpenCV' から出ます
g++ -g -Wall -std=c++11     check-opencv-version.o   -o check
make[1]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Learning_OpenCV/install-OpenCV' から出ます
./check
OpenCV version   : 4.0.1
Major version    : 4
Minor version    : 0
Subminor version : 1
```


```
 % ldd check
	linux-vdso.so.1 =>  (0x00007fff1fbf9000)
	libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007efdca36f000)
	libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007efdca159000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007efdc9d8f000)
	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007efdc9a86000)
	/lib64/ld-linux-x86-64.so.2 (0x00007efdca6f1000)
```