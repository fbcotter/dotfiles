# Non-interactive users (sshy, sync)
if not status --is-interactive
    exit # Skips the rest of this file, not exiting the shell
end

if test -z "$SSH_ENV"
    setenv SSH_ENV $HOME/.ssh/environment
end

# Start ssh agent
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
# set -g theme_display_user yes
# set -g theme_hide_hostname no

# Some bobthefish settings 
set -gx theme_nerd_fonts yes
set -gx theme_display_ruby no
set -gx theme_project_dir_length 1 
set -gx fish_prompt_pwd_dir_length 1 
set -gx theme_display_virtualenv yes
set -gx theme_display_user yes
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
# if the environment variable "COLORS" is set, set the scheme to light
if [ $LC_COLORS -a $LC_COLORS = "light" ] 
    set -gx theme_color_scheme solarized-light
else
    set -gx theme_color_scheme solarized-dark
end

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
alias mymatlab "set -gx SHELL /bin/bash; matlab"
alias mymatlab_shell "set -gx SHELL /bin/bash; matlab -nosplash -nodesktop"
alias cords pip
source $HOME/.config/fish/less_colours.fish
source $HOME/.config/fish/alias_vars.fish
set -gx TERM xterm-256color
set -gx PATH $PATH $HOME/.local/bin
set -gx TEXINPUTS ".:$HOME/mylatex:$HOME/mylatex/tikz-dsp:$TEXINPUTS"
set -gx BIBINPUTS "$HOME/mylatex:$BIBINPUTS"
set -gx BSTINPUTS "$HOME/mylatex:$BSTINPUTS"

function pycscope
    find . -path './venv' -prune -o -name '*.py*' -print > cscope.files
    cscope -bR
end
