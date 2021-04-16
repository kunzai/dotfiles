# change fonts
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes

# set -gx FZF_DEFAULT_COMMAND 'rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
# add flutter to the path
set -gx PATH /opt/flutter/bin $PATH
set -gx PATH /opt/android-studio/bin $PATH

# add dart to the path
# set -gx PATH ~/.pub-cache/bin $PATH
# set -gx PATH ~/.gem/ruby/2.7.0/bin $PATH
# set -gx PATH /usr/bin/perl $PATH
# set -gx PATH /usr/bin/vendor_perl $PATH

# set -gx EDITOR /usr/local/bin/nvim
# set -gx TERM "screen-256color"

# set -gx CHROME_EXECUTABLE /opt/google/chrome/chrome
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

# perl cpan environment variables
set -x PATH /home/kunzai/perl5/bin $PATH ^/dev/null;
set -q PERL5LIB; and set -x PERL5LIB /home/kunzai/perl5/lib/perl5:$PERL5LIB;
set -q PERL5LIB; or set -x PERL5LIB /home/kunzai/perl5/lib/perl5;
set -q PERL_LOCAL_LIB_ROOT; and set -x PERL_LOCAL_LIB_ROOT /home/kunzai/perl5:$PERL_LOCAL_LIB_ROOT;
set -q PERL_LOCAL_LIB_ROOT; or set -x PERL_LOCAL_LIB_ROOT /home/kunzai/perl5;
set -x PERL_MB_OPT --install_base\ \"/home/kunzai/perl5\";
set -x PERL_MM_OPT INSTALL_BASE=/home/kunzai/perl5;
