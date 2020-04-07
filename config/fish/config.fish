# change fonts
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes

# add flutter to the path
set -gx PATH ~/development/flutter/bin $PATH
# add dart to the path
set -gx PATH ~/development/flutter/bin/cache/dart-sdk/bin $PATH
set -gx PATH ~/.pub-cache/bin $PATH

set -gx EDITOR /usr/local/bin/nvim

set -gx CHROME_EXECUTABLE /opt/google/chrome/chrome
alias google-chrome "google-chrome-stable"

# enable images on term for twitter
alias rainbowstream "/usr/local/bin/rainbowstream -iot" # Or rainbowstream --image-on-term

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# add vi mode as default
fish_vi_key_bindings

# set capslock to esc 
setxkbmap -option caps:escape


# neofetch
# neofetch

# powerline-shell
function fish_prompt
    powerline-shell --shell bare $status
end
