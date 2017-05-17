# Set some environment variables
set -gx CUDA_HOME /usr/local/cuda
set -gx PATH $CUDA_HOME/bin/ $PATH
set -gx LD_LIBRARY_PATH "$LD_LIBRARY_PATH:$CUDA_HOME/lib64:$CUDA_HOME/extras/CUPTI/lib64:$HOME/code/cudnn5.1/cuda/lib64"
