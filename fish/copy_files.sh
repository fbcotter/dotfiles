#!/bin/bash
MYDIR=$( cd $(dirname $0) ; pwd -P )
FISHDIR="$HOME/.config/fish"

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

# Make a link to the config.fish file
echo "Symlinking config.fish to fish"
mkdir -p ~/.config/fish/functions
makesymlink $MYDIR/config.fish $FISHDIR/config.fish

# Make a link to the alias and environment variables file
makesymlink $MYDIR/alias_vars.fish $FISHDIR/alias_vars.fish

# Make a link to the less colours file
echo "Symlinking less_colours.fish to fish"
makesymlink $MYDIR/less_colours.fish $FISHDIR/less_colours.fish

# Make a link to each of the functions in the functions directory
FILES=$MYDIR/functions/*.fish
for f in $FILES 
do
    echo "Symlinking $(basename $f) to fish"
    makesymlink $f $FISHDIR/functions/$(basename $f)
done

echo "Install omf"
$MYDIR/install_omf.sh
