# dotfiles
My dotfiles setup

# general stuff
# reload init.vim file with :so %
# means :source current open file
https://github.com/dduan/dotfiles/


Linking the resources and making it possible
# tmux
ln -s ~/env_setup/dotfiles/.tmux ~/.tmux
ln -s ~/env_setup/dotfiles/.tmux.conf ~/.tmux.conf

# nvim
ln -s ~/env_setup/dotfiles/config/nvim ~/.config/nvim

###

# Install plugin manager: vim-plug
- URL: https://github.com/junegunn/vim-plug

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# In nvim to install plugins
:PlugInstall

