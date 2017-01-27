#!/bin/bash
MYDIR=$( cd $(dirname $0) ; pwd -P )
BINDIR=$HOME/.local/bin

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

# Make a link to each of the functions in the functions directory
FILES="$MYDIR/*"
# Make sure ~/.local/bin exists
mkdir -p $BINDIR

for f in $FILES 
do
    if [ "$(basename $f)" != "$(basename $0)" ]; then
        echo "Symlinking $(basename $f) to $BINDIR"
        makesymlink $f "$BINDIR"/"$(basename $f)"
    fi
done



