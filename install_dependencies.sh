#!/usr/bin/env bash 
set -ex 

sudo apt-get clean 
sudo apt-get update 
sudo apt-get upgrade -y 
sudo apt-get dist-upgrade -y 
sudo apt-get autoremove -y 
# Certain packages couldn't be installed without updating the distro to the latest dependencies
# like I couldn't install libgtk-3-dev...
# See https://www.raspberrypi.org/forums/viewtopic.php?p=1254646#p1254665 for issue and resolution 
sudo apt-get install -y devscripts debhelper cmake libldap2-dev libgtkmm-3.0-dev libarchive-dev \ 
                        libcurl4-openssl-dev intltool 
sudo apt-get install -y build-essential cmake pkg-config libjpeg-dev libtiff5-dev libjasper-dev \ 
                        libpng-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \ 
                        libxvidcore-dev libx264-dev libgtk2.0-dev libgtk-3-dev \ 
			libfontconfig1-dev libcairo2-dev \
			libgdk-pixbuf2.0-dev libpango1.0-dev \
                        libatlas-base-dev libblas-dev libeigen{2,3}-dev liblapack-dev \ 
			libhdf5-dev libhdf5-serial-dev libhdf5-103 \
			libqtgui4 libqtwebkit4 libqt4-test python3-pyqt5 \
                        gfortran \ 
                        python2.7-dev python3-dev python-pip python3-pip python python3 
sudo apt-get install -y libtiff5 libpango-1.0-0 libavcodec58 libgdk-pixbuf2.0-0 libjasper1 \
			libqt4-test libpangocairo-1.0-0 libswscale5 libilmbase23 libatk1.0-0 \
			libgtk-3-0 libqtcore4 libcairo2 libwebp6 libavutil56 libcairo-gobject2 \
			libopenexr23 libqtgui4 libavformat58
sudo pip2 install -U pip 
sudo pip3 install -U pip 
sudo pip2 install numpy 
sudo pip3 install numpy 