#!/bin/bash
MYDIR=$( cd $(dirname $0) ; pwd -P )
FISHDIR="$HOME/.config/fish"

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

# Make a link to the config.fish file
echo "Symlinking config.fish to fish"
mkdir -p ~/.config/fish/functions
makesymlink $MYDIR/config.fish $FISHDIR/config.fish

# Make a link to the alias and environment variables file
HOSTNAME=$(hostname)
case $HOSTNAME in
    (yoshi) 
        echo "Host detected as yoshi. Copying the yoshi aliases file"
        makesymlink $MYDIR/alias_vars_yoshi.fish $FISHDIR/alias_vars.fish;;
    (luigi) 
        echo "Host detected as luigi. Copying the luigi aliases file"
        makesymlink $MYDIR/alias_vars_luigi.fish $FISHDIR/alias_vars.fish;;
    (Glen) 
        echo "Host detected as Glen. Copying the Glen aliases file"
        makesymlink $MYDIR/alias_vars_glen.fish $FISHDIR/alias_vars.fish;;
    (hazza) 
        echo "Host detected as hazza. Copying the hazza aliases file"
        makesymlink $MYDIR/alias_vars_hazza.fish $FISHDIR/alias_vars.fish;;
    (*) 
        echo "Warning - Unkown Hostname. Blank alias file copied" && \
        makesymlink $MYDIR/alias_vars_blank.fish $FISHDIR/alias_vars.fish;;
esac

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

