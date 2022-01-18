#!/bin/fish

# time machine, exclude development dependencies automatically
brew install asimov
sudo brew services start asimov
# for latest development version
# brew services start asimov --head
# Warning: Taking root:admin ownership of some asimov paths:
#  /usr/local/Cellar/asimov/0.3.0/bin
#  /usr/local/Cellar/asimov/0.3.0/bin/asimov
#  /usr/local/opt/asimov
#  /usr/local/opt/asimov/bin
#  /usr/local/var/homebrew/linked/asimov
#This will require manual removal of these paths using `sudo rm` on
#brew upgrade/reinstall/uninstall.


# neovim development needed
sudo pnpm i -g -y prettier

# svelte
sudo pnpm i -g -y prettier-plugin-svelte

# live grep for telescope 
brew install rg
