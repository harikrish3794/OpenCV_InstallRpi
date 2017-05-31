echo "OpenCV-3.0 install"
sudo apt-get --assume-yes update
sudo apt-get --assume-yes upgrade

echo "Updating Rpi Firmware"

cd ~
echo "Downloading Files"
git clone https://github.com/Itseez/opencv.git
git clone https://github.com/Itseez/opencv_contrib.git

echo "Installing dependencies"
echo "If package not available,Remove the package in the shell script and run again"

sudo apt-get --assume-yes install build-essential git cmake pkg-config
sudo apt-get --assume-yes install libjpeg8-dev libtiff4-dev libjasper-dev libpng12-dev
sudo apt-get --assume-yes install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get --assume-yes install libgtk2.0-dev
sudo apt-get --assume-yes install libatlas-base-dev gfortran


sudo pip3 install numpy
sudo pip install numpy

cd ~/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_C_EXAMPLES=OFF \
	-D INSTALL_PYTHON_EXAMPLES=OFF \
	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
	-D BUILD_EXAMPLES=ON ..

echo "Make in 4 cores"
echo "ETA: 2-3Hrs"

make -j4

echo "Installing"
sudo make install

sudo ldconfig
