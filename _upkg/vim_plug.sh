if [[ ! -f "$NVIM_HOME/autoload/plug.vim" ]]; then
    pr_info "Installing Vim Plug."
    curl -fLo "$NVIM_HOME/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    pr_info "Updating Vim Plug."
    cd "$NVIM_HOME/autoload/plug.vim"
    git pull
    cd -
fi
