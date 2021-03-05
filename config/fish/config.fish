# change fonts
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes

# set -gx FZF_DEFAULT_COMMAND 'rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
set -gx EDITOR /usr/local/bin/nvim
# set -gx TERM "screen-256color"

set -gx CHROME_EXECUTABLE /opt/google/chrome/chrome
alias google-chrome "google-chrome-stable"

# enable images on term for twitter
alias rainbowstream "/usr/local/bin/rainbowstream -iot" # Or rainbowstream --image-on-term

# if not functions -q fisher
    # set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    # curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    # fish -c fisher
# end

set FZF_DEFAULT_COMMAND 'rg --files'

# add vi mode as default
fish_vi_key_bindings

# set capslock to esc
setxkbmap -option caps:ctrl_modifier

# set nvim PERL environment
set -gx PERL5LIB /home/kunzai/perl5/lib/perl5
set -gx PERL_LOCAL_LIB_ROOT /home/kunzai/perl5
set -gx PERL_MB_OPT '--install_bash "/home/kunzai/perl5"'
set -gx PERL_MM_OPT INSTALL_BASE=/home/kunzai/perl5PERL5LIB

# powerline-shell
function fish_prompt
    powerline-shell --shell bare $status
end

# set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
# source /usr/share/powerline/bindings/fish/powerline-setup.fish
# powerline-setup

