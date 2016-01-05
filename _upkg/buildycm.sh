#!/bin/bash

source nvimenv.sh

# YCM_DIR="$NVIM_HOME/plugged/YouCompleteMe"

# build_ycm()
# {
#     # Build YouCompleteMe
#     if [[ -d "$YCM_DIR" ]]; then
#         pr_info "Building YouCompleteMe"
#         cd "$YCM_DIR"
#         git submodule update --init --recursive
#         echo $(git rev-parse HEAD) > $THIS_DIR/last_ycm
#         ./install.sh --clang-completer
#         cd -
#     fi
# }

# if [[ ! -d "$YCM_DIR" ]]; then
#     rm -f $THIS_DIR/this_ycm
#     rm -f $THIS_DIR/last_ycm
#     touch $THIS_DIR/last_ycm
#     git clone https://github.com/Valloric/YouCompleteMe "$YCM_DIR"
# else
#     cd "$YCM_DIR"
#     git pull
#     cd -
# fi

# if [[ ! -f  $THIS_DIR/last_ycm ]]; then
#     build_ycm
# else
#     cd "$YCM_DIR"
#     echo $(git rev-parse HEAD) > $THIS_DIR/this_ycm
#     cd -

#     cmp $THIS_DIR/last_ycm  $THIS_DIR/this_ycm
#     lc=$?
#     if [[ "$lc" != "0" ]]; then
#         build_ycm
#     fi
# fi

# if [[ ! -d 'deoplete.nvim' ]]; then
#     git clone https://github.com/Shougo/deoplete.nvim.git
# else
#     cd 'deoplete.nvim'
#     git pull
#     cd -
# fi

# mkdir -p "${NVIM_HOME}/autoload"
# mkdir -p "${NVIM_HOME}/doc"
# mkdir -p "${NVIM_HOME}/plugin"
# mkdir -p "${NVIM_HOME}/rplugin"

# cd 'deoplete.nvim'
# /usr/bin/cp -fvr ./autoload/* "${NVIM_HOME}/autoload"
# /usr/bin/cp -fvr ./doc/* "${NVIM_HOME}/doc"
# /usr/bin/cp -fvr ./plugin/* "${NVIM_HOME}/plugin"
# /usr/bin/cp -fvr ./rplugin/* "${NVIM_HOME}/rplugin"
# cd -
