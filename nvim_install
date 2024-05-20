#!/bin/env bash
# exit when any command fails
set -e
# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
if [ $? -ne 0 ]; then
    trap 'echo "\"${last_command}\" command had an exit code $?."' EXIT
fi

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

