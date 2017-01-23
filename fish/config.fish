# Non-interactive users (sshy, sync)
if not status --is-interactive
    exit # Skips the rest of this file, not exiting the shell
end

# Install Fundle Package manager
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# Install some packages
# Start ssh agent automatically
#fundle plugin 'tuvistavie/fish-ssh-agent'
# Start an ssh-agent (manual option for 
# tuvistatvie/fish-ssh-agent)
if test -z "$SSH_ENV"
    setenv SSH_ENV $HOME/.ssh/environment
end

if not __ssh_agent_is_started
    __ssh_agent_start
end

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
# fish -v outputted to stderr on some of my machines??
# Hence the 2>&1
if fish -v 2>&1 | grep 2.[0-2] > /dev/null 
    fish_vi_mode
else
    fish_vi_key_bindings
end

# Some aliases/environment variables
set -gx EDITOR vim
alias gitlog "git log --graph --decorate --oneline --all"
alias latexmk "latexmk -pdf -pvc"
alias gtree "tree -a -I '.git|venv|*.egg-info|build|.cache|__pycache__|.ipynb_checkpoints|dist'"
source $HOME/.config/fish/less_colours.fish
source $HOME/.config/fish/alias_vars.fish
set -gx TERM xterm-256color

# Some simple functions
function glen 
    ssh -t glen screen -dR $argv
end
function yoshi
    ssh -t yoshi screen -dR $argv
end
function azure
    ssh -t azure screen -dR $argv
end
