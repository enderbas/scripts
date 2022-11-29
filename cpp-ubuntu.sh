#!/bin/bash

sudo apt update
apt upgrade -y

apt install -y net-tools

apt install -y build-essential openssl libssl-dev libssl1.0 libgl1-mesa-dev libqt5x11extras5
apt install -y git cmake
apt install -y qtcreator
apt install -y qt5-default
apt install -y qt5-doc qtbase5-examples qtbase5-doc-html
