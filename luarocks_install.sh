#!/bin/env bash

sudo apt install -y build-essential libreadline-dev unzip
if [ -d ~/luarocks-3.12.2 ]; then
    rm -rf ~/luarocks-3.12.2
fi
cd ~
curl -L -R -O https://luarocks.github.io/luarocks/releases/luarocks-3.12.2.tar.gz
tar zxf luarocks-3.12.2.tar.gz
rm luarocks-3.12.2.tar.gz
cd luarocks-3.12.2
./configure
make all test
sudo make install
