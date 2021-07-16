
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

export THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export NVIM_HOME="$XDG_CONFIG_HOME/nvim"
export NVIM_INIT="$XDG_CONFIG_HOME/nvim/init.vim"
export NVIM_GINIT="$XDG_CONFIG_HOME/nvim/ginit.vim"

pr_info "THIS_DIR=$THIS_DIR"
pr_info "XDG_DATA_HOME=$XDG_DATA_HOME"
pr_info "NVIM_HOME=$NVIM_HOME"
pr_info "NVIM_INIT=$NVIM_INIT"
pr_info "NVIM_GINIT=$NVIM_GINIT"

# Make sure we have the needed directories
mkdir -p "$NVIM_HOME/undos"
mkdir -p "$XDG_DATA_HOME/shada"
