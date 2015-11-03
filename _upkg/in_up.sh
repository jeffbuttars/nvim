
source nvimenv.sh

./install_nvim.sh

# Link our UltiSnips up
ln -nsf ${THIS_DIR}/../nvim/UltiSnips "$NVIM_HOME/"
