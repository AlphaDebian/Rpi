# Install OpenCV 4.1.2 on Raspbian Buster:

- Flash Raspbian BusterOS to your MicroSD. We will be installing Opencv 4 on your Pi from scratch.
- You must have ssh or VNC connection established with your Pi. Alternatively, you could use a keyboard + mouse + screen.

## 1. Expand your filesystem

  `$ sudo raspi-config`
  
   and then select the "7 Advanced Options" menu item.
   
   Followed by selecting "A1 Expand filesystem".
   
   Once prompted, you should select the first option, "A1 Expand File System", hit enter on your keyboard, use arrow keys to navigate to the "Finish" button, and then reboot your Pi -- if the reboot is not prompted then simply execute:
   
`$sudo reboot`
  
After rebooting, your file system should have expanded to include all available space on your micro-SD card. You can verify that the disk has expanded by executing: df -h and examining the output as follows:

	$ df -h
	| Filesystem      | Size  | Used  | Avail | Use% | Mounted on     |
	| /dev/root       |  29G  | 2.3G  |  26G  | 12%  | /              |
	| devtmpfs        | 1.8G  |    0  | 1.8G  | 0%   | /dev           |
	| tmpfs           | 1.9G  |    0  | 1.9G  | 0%   | /dev/shm       |
	| tmpfs           | 1.9G  | 8.6M  | 1.9G  | 1%   | /run           |
	| tmpfs           | 5.0M  | 4.0K  | 5.0M  | 1%   | /run/lock      |
	| tmpfs           | 1.9G  |    0  | 1.9G  | 0%   | /sys/fs/cgroup |
	| /dev/mmcblk0p1  | 253M  |  40M  | 213M  | 16%  | /boot          |
	| tmpfs           | 386M  |    0  | 386M  | 0%   | /run/user/1000 |
  

## 2> This step is optional for users with boards having greater than 1GB of memory:

   Compiling opencv is memory intensive, you will likely need to increase your swap size. To increase the default swap size from 100MB to 2GB you may follow either of the procedures:
```
$ sudo dphys-swapfile swapoff
$ sudo sed -i 's:CONF_SWAPSIZE-.*:CONF_SWAPSIZE=2048:g' /etc/dphys-swapfile
$ sudo reboot
```
OR
```
$ sudo nano /etc/dphys-swapfile
```
now edit the CONF_SWAPFILE from 100 to 2048
```
# set size to absolute value, leaving empty (default) then uses computed value
#   you most likely don't want this, unless you have an special disk situation
# CONF_SWAPSIZE=100
CONF_SWAPSIZE=2048
```
Save and exit via ctrl + x, y, enter.
```
$ sudo /etc/init.d/dphys-swapfile stop
$ sudo /etc/init.d/dphys-swapfile start
$ sudo reboot (optional)
```

## 3> Download the scripts with this repo and execute the following shell commands:
```
$ chmod +x *.sh
$ ./remove-wolfram_libreoffice.sh  (optional)
$ ./install_dependencies.sh
```
If you have a Raspberry Pi Camera Module attached to your Rpi, you should install PiCamera API now as well, then:
```
$ pip install "picamera[array]"
```

## 4> Decide if you want partial install or the complete installation of the opencv 4
Step 4a It is by far the fastest and the easiest method to install OpenCV. After this skip to step 5 to test the install and your code. The only draw back is that you cannot use the patented algorithms directly and may be insufficient for many projects I know of...
  
Step 4b gives you the complete installation of OpenCV 4 from its binary source including patented ("Non-free") algorithms. It will take 2-6 hours depending on the processor on your Rpi.

###   4.a> pip install OpenCV 4 Python
In a matter of seconds, you can pip install OpenCV for Python. Just execute the following shell command in the terminal as super-user.
```
$ sudo pip3 install opencv-python
```

###   4.b> Compile OpenCV 4.1.2 from source
- Downloading the OpenCV source code for both the opencv and opencv_contrib repositories, followed by unarchiving them:

```
$ ./download-opencv-4.1.2.sh
```
- Compiling OpenCV 4.1.2 using cmake:

```
$ ./build-opencv-4.1.2.sh
```
- Installing OpenCV

```
$ cd ~/opencv/opencv-4.1.2/build/
$ sudo make install
```
## 5> Reset your SWAP
Don't forget to resize your swap to its default or smaller values as running with high swap size may lead to corrupted sd card. As we know that a micro-SD card has a limited number of 1s and 0s to be overwritten with, the continuous rewriting of the memory space may damage your sd card and corrupt it for good.
```
$ sudo dphys-swapfile swapoff
$ sudo sed -i 's:CONF_SWAPSIZE=.*:CONF_SWAPSIZE=200:g' /etc/dphys-swapfile
$ sudo reboot
```

## 6> Test OpenCV
You can run the following python code to ensure that opencv is installed on your pi:
```
$ wget "https://upload.wikimedia.org/wikipedia/en/7/7d/Lenna_%28test_image%29.png" -O lenna.jpg
$ python3 test.py lenna.jpg
$ python3 test2.py
```
