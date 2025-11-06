#!/bin/env bash
if [ -d ~/neovim ]; then
    rm -rf ~/neovim
fi

# install prerequisites
sudo apt-get install -y ninja-build gettext cmake unzip curl

# build steps
cd ~
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo 2>&1 | tee make.log
sudo make install
