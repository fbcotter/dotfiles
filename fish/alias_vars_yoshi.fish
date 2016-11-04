# Set some environment variables
set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH $CUDA_HOME/lib64:$CUDA_HOME/extras/CUPTI/lib64:$HOME/code/cuda8.0/cuda/lib64
set -x CUDA_HOME /usr/local/cuda
set -x PATH /usr/local/cuda/bin/ $PATH
