#!/bin/bash

source nvimenv.sh

YCM_DIR="$NVIM_HOME/bundle/YouCompleteMe"

build_ycm()
{
    # Build YouCompleteMe
    if [[ -d "$YCM_DIR" ]]; then
        pr_info "Building YouCompleteMe"
        cd "$YCM_DIR"
        git submodule update --init --recursive
        echo $(git rev-parse HEAD) > $THIS_DIR/last_ycm
        ./install.sh --clang-completer

        cd -
    fi
}

if [[ ! -d  "$YCM_DIR" ]]; then
    git clone https://github.com/Valloric/YouCompleteMe "$YCM_DIR"
fi

if [[ ! -f  $THIS_DIR/last_ycm ]]; then
    build_ycm
else
    echo $(git rev-parse HEAD) > $THIS_DIR/this_ycm
    cmp $THIS_DIR/last_ycm  $THIS_DIR/this_ycm
    lc=$?
    if [[ "$lc" != "0" ]]; then
        build_ycm
    fi
fi
