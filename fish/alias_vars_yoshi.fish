# Set some environment variables
set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH $CUDA_HOME/lib64:$CUDA_HOME/extras/CUPTI/lib64:$HOME/code/cuda8.0/cuda/lib64
set -gx CUDA_HOME /usr/local/cuda
set -gx PATH /usr/local/cuda/bin/ $PATH
