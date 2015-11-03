
# Use `$XDG_CONFIG_HOME/nvim/init.vim` instead of `.vimrc` for storing 
#  configuration.
#- Use `$XDG_CONFIG_HOME/nvim` instead of `.vim` to store configuration files.
#- Use `$XDG_DATA_HOME/shada/main.shada` instead of `.viminfo` for persistent 
#  session information.

if [[ -z $XDG_DATA_HOME ]]; then
    export XDG_DATA_HOME="$HOME/.local"
fi

if [[ -z $XDG_CONFIG_HOME ]]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

export NVIM_HOME="$XDG_CONFIG_HOME/nvim"


./install_nvim.sh

# Make sure we have the needed directories
mkdir -p "$NVIM_HOME/undos"
mkdir -p "$NVIM_HOME/undos"
mkdir -p "$XDG_DATA_HOME/shada"

if [[ ! -d  "$NVIM_HOME/bundle/YouCompleteMe" ]]; then
    git clone https://github.com/Valloric/YouCompleteMe "$NVIM_HOME/bundle/YouCompleteMe"
    source buildycm.sh
fi

# Link our UltiSnips up
ln -nsf ${THIS_DIR}/../nvim/UltiSnips "$NVIM_HOME/"

