# Set some environment variables
set -gx CUDA_HOME /usr/local/cuda-9.0
set -gx LD_LIBRARY_PATH "$LD_LIBRARY_PATH:$CUDA_HOME/lib64:$CUDA_HOME/extras/CUPTI/lib64"
set -gx LD_LIBRARY_PATH "$LD_LIBRARY_PATH:$HOME/code/cuda9.0/cudnn7.0/lib64"
set -gx DOCKER_ID_USER "fbcotter"
set -gx HOME "/scratch/fbc23"
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PATH $PYENV_ROOT/bin $CUDA_HOME/bin/ /scratch/fbc23/bin $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

alias scidock "nvidia-docker run -it --rm -v /scratch/fbc23/:/host -v /netscratch/mario/share/:/data1 -v /netscratch/yoshi/share/:/data2 -p 15000:15000 fbcotter/docker-scipy:latest jupyter notebook --allow-root --port 15000"
alias scidockcl "nvidia-docker run -it --rm -v /scratch/fbc23/:/host -v /netscratch/mario/share/:/data1 -v /netscratch/yoshi/share/:/data2 fbcotter/docker-scipy:latest /bin/bash" 
