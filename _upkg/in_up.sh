

./install_nvim.sh

# Make sure we have an undos directory
mkdir -p ~/.nvim/undos

# Make sure we have an undos directory
mkdir -p ~/.nvim/undos
mkdir -p ~/.nvim/bundle

if [[ ! -d  ~/.nvim/bundle/YouCompleteMe ]]; then
    git clone https://github.com/Valloric/YouCompleteMe ~/.nvim/bundle/YouCompleteMe
    source buildycm.sh
fi

# Link our UltiSnips up
ln -nsf ${THIS_DIR}/../nvim/UltiSnips ~/.nvim/

