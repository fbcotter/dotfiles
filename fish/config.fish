# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
set PATH /usr/local/bin/ $PATH
set PATH ~/.local/bin $PATH
set PATH /usr/local/go/bin $PATH

export GOPATH=/home/fbc23/code/go
set PATH $GOPATH/bin $PATH

alias rm "echo Use 'trash', 'del' or the full path i.e. '/bin/rm'"
alias ipy "python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias ipy3 "python3 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias gitlog "git log --graph --decorate --oneline"
