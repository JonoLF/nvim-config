#!/bin/env bash
# exit when any command fails
set -e
# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
if [ $? -ne 0 ]; then
    trap 'echo "\"${last_command}\" command had an exit code $?."' EXIT
fi

# install ripgrep
if ! command -v rg &> /dev/null
then
    echo "-----------------------------------------"
    echo "ripgrep could not be found, installing..."
    echo "-----------------------------------------"
    sudo apt-get install -y ripgrep
else
    echo "-----------------------------------------"
    echo "ripgrep already installed"
    echo "-----------------------------------------"
fi

# install ctags
# check for autotools
if ! command -v autoconf &> /dev/null
then
    echo "-----------------------------------------"
    echo "autoconf could not be found, installing..."
    echo "-----------------------------------------"
    sudo apt-get install -y autoconf autotools-dev
else
    echo "-----------------------------------------"
    echo "autoconf already installed"
    echo "-----------------------------------------"
fi
