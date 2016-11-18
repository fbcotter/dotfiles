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

for file in .{ctags,functions,gitconfig,gitignore,gvimrc,inputrc,latexmkrc,screenrc,vimrc,wgetrc};
do
    [ -r "$MYDIR/$file" ] && [ -f "$MYDIR/$file" ] && \
        echo "Symlinking $file" && \
        makesymlink $MYDIR/$file $HOME/$file;
done;
unset file;

# Make a link to the alias and environment variables file
case $HOSTNAME in
    (yoshi) 
        echo "Host detected as yoshi.";;
    (Glen) 
        echo "Host detected as Glen.";;
    (hazza) 
        echo "Host detected as hazza.";;
    (*) 
        echo "Warning - Unkown Hostname.";;
esac


