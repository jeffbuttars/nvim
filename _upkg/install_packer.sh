# #!/bin/bash

# # There is also an AUR package available, if it's installed, note it, and bail.
# # prefer a system install over the local

# if [[ -d "/usr/share/nvim/site/pack/packer" ]]; then
#     echo "Packer already installed on your system"
# else
#     if [[ ! -d "~/.local/share/nvim/site/pack/packer/start/packer.nvim" ]]; then
#         pr_info "Installing Packer..."
#         git clone --depth 1 https://github.com/wbthomason/packer.nvim\
#             ~/.local/share/nvim/site/pack/packer/start/packer.nvim
#     else
#         pr_info "Updating Packer..."
#         cd "~/.local/share/nvim/site/pack/packer/start/packer.nvim"
#         git pull
#         cd -
#     fi
# fi

# # mkdir -p "$NVIM_HOME/autoload"
# # curl -fLo "$NVIM_HOME/autoload/plug.vim" \
# #     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# # pr_info "Installing Paq..."
# # mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/paqs/opt/paq-nvim"
# # git clone https://github.com/savq/paq-nvim.git \
# #     "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/paqs/opt/paq-nvim"
