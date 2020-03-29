#!/usr/bin/env bash 
set -ex 


cd ~ 
mkdir -p opencv && pushd opencv 

 
wget -O "opencv-4.1.2.tar.gz" "https://github.com/opencv/opencv/archive/4.1.2.tar.gz" 
wget -O "opencv_contrib-4.1.2.tar.gz" "https://github.com/opencv/opencv_contrib/archive/4.1.2.tar.gz" 
tar -xvf "opencv-4.1.2.tar.gz" 
tar -xvf "opencv_contrib-4.1.2.tar.gz" 

popd 
