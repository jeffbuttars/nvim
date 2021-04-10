pr_info "Installing Vim Plug."
curl -fLo "$NVIM_HOME/autoload/plug.vim" --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pr_info "Installing Paq..."
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/paqs/opt/paq-nvim"
git clone https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/paqs/opt/paq-nvim"
