#!/bin/bash

pr_info "Installing Vim Plug."
mkdir -p "$NVIM_HOME/autoload"
curl -fLo "$NVIM_HOME/autoload/plug.vim" \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
