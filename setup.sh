echo "Robocup3D simulation Server and Monitor Installer"

sudo apt update

sudo apt install git -y

git submodule update --init

sudo apt install build-essential subversion cmake make libfreetype6-dev libsdl1.2-dev ruby ruby-dev libdevil-dev libboost-dev libboost-thread-dev libboost-regex-dev libboost-system-dev qt4-default libqt4-opengl libqt4-opengl-dev -y

sudo apt install autogen automake libtool libtbb-dev -y
cd ode-tbb
./autogen.sh
./configure --enable-shared --disable-demos --enable-double-precision --disable-asserts --enable-malloc
make -j$(nproc)
sudo make install
cd ..


cd SimSpark/spark
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
sudo ldconfig
cd ../../rcssserver3d
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
sudo ldconfig
cd ../../..

sudo apt install rsync -y
cd RoboViz
./scripts/build-linux64.sh

cd ..
ADir="\$bindir/rcssmonitor3d"
BDir="$( cd RoboViz/bin/linux-amd64 && pwd)/roboviz.sh"
sudo sed -i "s#$ADir#${BDir}#" /usr/local/bin/rcsoccersim3d
echo "Rebinding with RoboViz"

echo "Installation Done"
