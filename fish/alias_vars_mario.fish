# Set some environment variables
set -gx CUDA_HOME /usr/local/cuda-8.0
set -gx LD_LIBRARY_PATH "$LD_LIBRARY_PATH:$CUDA_HOME/lib64:$CUDA_HOME/extras/CUPTI/lib64"
set -gx LD_LIBRARY_PATH "$LD_LIBRARY_PATH:$HOME/code/cuda8.0/cudnn5.1/lib64"
set -gx LD_LIBRARY_PATH "$LD_LIBRARY_PATH:$HOME/code/cuda8.0/cudnn6.0/lib64"
set -gx HOME "/scratch/fbc23"
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PATH $PYENV_ROOT/bin $CUDA_HOME/bin/ $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
