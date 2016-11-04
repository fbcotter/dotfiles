# Install Fundle Package manager
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# Install some packages
# Start ssh agent automatically
fundle plugin 'tuvistavie/fish-ssh-agent'

# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# Some agnoster settings -> display user@host
set -g theme_display_user yes
set -g theme_hide_hostname no

# Turn on vim bindings
if fish -v | grep 2.2 > /dev/null 
    fish_vi_mode
else
    fish_vi_key_bindings
end

# Some constant aliases/environment variables
set -x EDITOR vim
alias gitlog "git log --graph --decorate --oneline"

# Import some machine specific aliases and environment variables
if [ (hostname) = "hazza" ]
    if test -f $HOME/repos/fbcotter/dotfiles/fish/alias_vars_hazza.fish
        source $HOME/repos/fbcotter/dotfiles/fish/alias_vars_hazza.fish
    end
else if [ (hostname) = "yoshi" ]
    if test -f $HOME/repos/fbcotter/dotfiles/fish/alias_vars_yoshi.fish
        source $HOME/repos/fbcotter/dotfiles/fish/alias_vars_yoshi.fish
    end
else if [ (hostname) = "glen" ]
    if test -f $HOME/repos/fbcotter/dotfiles/fish/alias_vars_glen.fish
        source $HOME/repos/fbcotter/dotfiles/fish/alias_vars_glen.fish
    end
end
