!# /bin/bash
cd 
mkdir opencv
cd opencv
echo "foders created   !!!"
sudo apt-get -qq remove ffmpeg x264 libx264-dev
echo "removed libraries"

sudo apt-get -qq install libopencv-dev build-essential checkinstall cmake pkg-config yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip

echo "installed new libraries"

sudo add-apt-repository ppa:mc3man/trusty-media

sudo apt-get update

sudo apt-get install ffmpeg gstreamer0.10-ffmpeg

echo "installed ffmpeg"

wget -O OpenCV-2.4.9.zip http://fossies.org/linux/misc/opencv-2.4.9.zip

unzip OpenCV-2.4.9.zip

cd opencv-2.4.9

echo "Downloaded and extracted OpenCV"

mkdir build

cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..

echo "cmake done   !!!"

make -j2

sudo make install

echo "make fatto e anche install make"

sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'


sudo ldconfig

echo "finish!!"