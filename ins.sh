#!/bin/bash

echo "Robocup 3D simulation Env installation script START"

if [[ $EUID -ne 0 ]]; then
    apt update
    apt install sudo -y
fi

sudo apt update  

sudo apt install git -y

cd ~

mkdir ./.local/Robocup3d -p

cd ./.local/Robocup3d

git clone https://https://github.com/hfutrobocup3d/robocup3d-setup

cd robocup3d-setup

./setup.sh

echo "Robocup 3D simulation Env installation script END"
