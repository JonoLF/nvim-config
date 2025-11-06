#!/bin/env bash
if [ -d ~/lua-5.4.8 ]; then
    rm -rf ~/lua-5.4.8
fi

# build steps
cd ~
curl -L -R -O https://www.lua.org/ftp/lua-5.4.8.tar.gz
tar zxf lua-5.4.8.tar.gz
rm lua-5.4.8.tar.gz
cd lua-5.4.8
make all test
sudo make install
