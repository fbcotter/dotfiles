alias gitlog "git log --graph --decorate --oneline --all"
alias gitlog2 "git log --graph --decorate --oneline"
alias clean_orig "find . -name '*.orig' -delete"
alias cp "cp -i"
alias mv "mv -i"
alias latexmk "latexmk -pdf -pvc"
alias gtree "tree -a -I '.git|venv|*.egg-info|build|.cache|__pycache__|.ipynb_checkpoints|dist'"
alias wayve "bass source $HOME/WayveCode/deeplearning/activate"
alias spotify="/snap/bin/spotify --force-device-scale-factor=1.8"

set -gx LC_COLORS dark
set -gx EDITOR nvim
set -gx TERM xterm-256color
set -gx MANPATH (manpath -q)
set -gx MANPATH "$MANPATH:$HOME/man"
set -gx PATH $HOME/.local/bin $PATH
