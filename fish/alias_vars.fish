alias gitlog "git log --graph --decorate --oneline --all"
alias gitlog2 "git log --graph --decorate --oneline"
alias cp "cp -i"
alias mv "mv -i"
alias latexmk "latexmk -pdf -pvc"
alias gtree "tree -a -I '.git|venv|*.egg-info|build|.cache|__pycache__|.ipynb_checkpoints|dist'"
alias tb "nc termbin.com 9999"

set -gx NPM_PACKAGES "$HOME/.npm-packages"
set -gx EDITOR nvim
set -gx TERM xterm-256color
