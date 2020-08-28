
source nvimenv.sh

./install_nvim.sh

# Link our UltiSnips up
ln -nsf ${THIS_DIR}/../nvim/UltiSnips "$NVIM_HOME/"
ln -nsf ${THIS_DIR}/../nvim/coc-settings.json "$NVIM_HOME/"
