# Aliases
# alias rm "echo Use 'trash', 'del' or the full path i.e. '/bin/rm'"
alias ipy "python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias ipy3 "python3 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

# Environment variables
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PATH $PYENV_ROOT/bin ~/.local/bin /usr/local/texlive/2016/bin/x86_64-linux $PATH
# set -gx MANPATH /usr/local/texlive/2016/texmf-dist/doc/man /usr/local/man
set -gx INFOPATH $INFOPATH /usr/local/texlive/2016/texmf-dist/doc/info
set -gx PYENV_VIRTUALENV_DISABLE_PROMPT 1
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
set -gx LC_SSH_LOGIN 1
