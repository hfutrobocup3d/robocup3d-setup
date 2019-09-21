echo "Robocup3D simulation Server and Monitor Installer"
echo "make sure you have a good connectivity to Github"

sudo apt update

sudo apt install build-essential subversion git cmake libfreetype6-dev libsdl1.2-dev ruby ruby-dev libdevil-dev libboost-dev libboost-thread-dev libboost-regex-dev libboost-system-dev qt4-default -y

sudo apt install autogen automake libtool libtbb-dev -y
git clone https://github.com/sgvandijk/ode-tbb.git
cd ode-tbb
./autogen.sh
./configure --enable-shared --disable-demos --enable-double-precision --disable-asserts --enable-malloc
make -j$(nproc)
sudo make install
cd ..


git clone https://gitlab.com/robocup-sim/SimSpark
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

echo "Installation Done"
