#! /bin/bash

apt update||echo "NO ERR"
apt install -y sudo

sudo apt install -y autoconf autoconf-archive automake build-essential git cmake libavcodec-dev libgl1-mesa-dev nasm \
                 ninja-build qt6-base-dev qt6-tools-dev-tools qt6-multimedia-dev qt6-wayland ccache fonts-liberation2 \
                 zip unzip curl tar wget lsb-release nano vim


wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/kitware.list
sudo apt update -y && sudo apt install cmake -y


sudo wget -O /usr/share/keyrings/llvm-snapshot.gpg.key https://apt.llvm.org/llvm-snapshot.gpg.key
echo "deb [signed-by=/usr/share/keyrings/llvm-snapshot.gpg.key] https://apt.llvm.org/$(lsb_release -sc)/ llvm-toolchain-$(lsb_release -sc)-18 main" | sudo tee -a /etc/apt/sources.list.d/llvm.list
sudo apt update -y && sudo apt install clang-18 clangd-18 clang-format-18 clang-tidy-18 lld-18 -y

https://github.com/LadybirdBrowser/ladybird
cd ladybird/||echo "NO ERR"

echo "-----------------------------"
pwd
ls -al
echo "-----------------------------"

# BUILD_PRESET=Debug ./Meta/ladybird.sh run ladybird
time ./Meta/ladybird.sh build ladybird && time ./Meta/ladybird.sh install ladybird
