#!/bin/bash

echo "Robocup 3D simulation Env installation script START"

sudo apt update  

sudo apt install git -y

cd ~

mkdir ./.local/Robocup3d -p

cd ./.local/Robocup3d

git clone https://gitee.com/doot/Robocup3dInstaller.git

cd Robocup3dInstaller

./setup.sh

echo "Robocup 3D simulation Env installation script END"
