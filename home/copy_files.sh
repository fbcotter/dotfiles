#!/bin/bash
MYDIR=$( cd $(dirname $0) ; pwd -P )
BASHDIR=$HOME

# function makesymlink 
#   Move the old file to a saved location (only if it wasn't
#   a symlink). It is likely that this symlink will be pointing
#   to where we want it to, but it is trivial to just remove it,
#   add it again, and be sure about it.
function makesymlink {
    if [ -f $2 ]; then
        if [ -h $2 ]; then
            rm $2
        else
            mv $2 $2.old
        fi
    fi
    ln -s $1 $2
}

for file in .{ctags,functions,gitconfig,gitignore,gvimrc,inputrc,latexmkrc,screenrc,vimrc,wgetrc,gitattributes,tmux.conf}
do
    [ -r "$MYDIR/$file" ] && [ -f "$MYDIR/$file" ] && \
        echo "Symlinking $file" && \
        makesymlink $MYDIR/$file $HOME/$file;
done;
unset file;

# Download vundle
echo "Downloading Vundle for Vim"
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    mkdir -p ~/.vim/bundle/Vundle.vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Copy matplotlibrc file
if [ ! -d "$HOME/.config/matplotlib" ]; then
    mkdir -p "$HOME/.config/matplotlib"
fi
echo "Symlinking matplotlibrc" 
makesymlink $MYDIR/matplotlibrc $HOME/.config/matplotlib/matplotlibrc

# Make a link to the alias and environment variables file
case $HOSTNAME in
    (yoshi) 
        echo "Host detected as yoshi.";;
    (Glen) 
        echo "Host detected as Glen.";;
    (hazza) 
        echo "Host detected as hazza.";;
    (luigi) 
        echo "Host detected as luigi.";;
    (*) 
        echo "Warning - Unkown Hostname.";;
esac


