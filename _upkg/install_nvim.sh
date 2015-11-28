#!/bin/bash

# Relying on distro packages now!
exit 0

source pkgs.sh

GIT_DST_DIR="${PWD}/neovim"
NEOVIM_DST_DIR='/opt/neovim'
GIT_REPO='https://github.com/neovim/neovim.git'

sudo mkdir -p "$NEOVIM_DST_DIR"


if [[ -d "$GIT_DST_DIR" ]]; then
    cd "$GIT_DST_DIR"
    git fetch
    cd -
else
    git clone "$GIT_REPO" "$GIT_DST_DIR"
fi

cd "$GIT_DST_DIR"

# Use the most recent version tag to get latest 'stable'
vtag=$(git tag | grep '^v.*' | sort -r | head -n 1)
if [[ -z $vtag ]]; then
    vtag="master"
fi

pr_info "Using Nvim branch/tag $vtag"
sleep 1

git checkout "$vtag"
git merge "$vtag"

make -j8 CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=${NEOVIM_DST_DIR}"
sudo make install
cd -
