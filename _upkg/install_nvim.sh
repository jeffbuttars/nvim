#!/bin/bash

GIT_DST_DIR="${PWD}/neovim"
NEOVIM_DST_DIR='/opt/neovim'
GIT_REPO='https://github.com/neovim/neovim.git'

sudo mkdir -p "$NEOVIM_DST_DIR"

if [[ -d "$GIT_DST_DIR" ]]; then
    cd "$GIT_DST_DIR"
    git pull
    cd -
else
    git clone "$GIT_REPO" "$GIT_DST_DIR"
fi

cd "$GIT_DST_DIR"
make -j8 CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=${NEOVIM_DST_DIR}"
sudo make install
cd -
