#!/bin/bash
MYDIR=$( cd $(dirname $0) ; pwd -P )
BASHDIR=$HOME

# function makesymlink 
#   Move the old file to a saved location (only if it wasn't
#   a symlink). It is likely that this symlink will be pointing
#   to where we want it to, but it is trivial to just remove it,
#   add it again, and be sure about it.
function makesymlink {
    if [ -h $2 ]; then
        rm $2
    elif [ -f $2 ]; then
        echo "$2 exists. Moving it to $2.old"
        mv $2 $2.old
    fi
    ln -s $1 $2
}

echo "Symlinking dotfiles..." 
for file in .{ctags,functions,gitconfig,gitignore,inputrc,latexmkrc,screenrc,wgetrc,gitattributes,tmux.conf,pylintrc}
do
    [ -r "$MYDIR/$file" ] && [ -f "$MYDIR/$file" ] && \
        echo "Symlinking $file" && \
        makesymlink $MYDIR/$file $HOME/$file;
done;

echo "Symlinking lint configs..." 
for file in {flake8.setup.cfg,mypy.ini,pylintrc.txt}
do
    [ -r "$MYDIR/$file" ] && [ -f "$MYDIR/$file" ] && \
        echo "Symlinking $file" && \
        makesymlink $MYDIR/$file $HOME/$file;
done;
unset file;

echo "Other..." 
# Copy matplotlibrc file
if [ ! -d "$HOME/.config/matplotlib" ]; then
    mkdir -p "$HOME/.config/matplotlib"
fi
echo "Symlinking matplotlibrc" 
makesymlink $MYDIR/matplotlibrc $HOME/.config/matplotlib/matplotlibrc

# Copy dircolors
if [ ! -d "$HOME/.dir_colors" ]; then
    mkdir -p "$HOME/.dir_colors"
fi
echo "Symlinking dircolors" 
makesymlink $MYDIR/dircolors $HOME/.dir_colors/dircolors
