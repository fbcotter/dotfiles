set -gx PATH /usr/local/bin /Developer/NVIDIA/CUDA-8.0/bin $PATH
set -gx DYLD_LIBRARY_PATH "/usr/local/cuda/lib:/Developer/NVIDIA/CUDA-8.0/lib:$DYLD_LIBRARY_PATH"
#set -gx PATH ~/anaconda3/bin $PATH
#source (conda info --root)/bin/conda.fish
alias rm "echo Use 'trash', 'del' or the full path i.e. '/bin/rm'"
alias ipy "python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias ipy3 "python3 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias screen "/usr/local/bin/screen"
