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

# Make a link to the config.fish file
echo "Symlinking bash_profile"
makesymlink $MYDIR/bash_profile $BASHDIR/.bash_profile

echo "Symlinking aliases"
makesymlink $MYDIR/bash_aliases $BASHDIR/.bash_aliases

echo "Symlinking bashrc"
makesymlink $MYDIR/bashrc $BASHDIR/.bashrc

echo "Symlinking prompt"
makesymlink $MYDIR/bash_prompt $BASHDIR/.bash_prompt

echo "Symlinking functions"
makesymlink $MYDIR/bash_functions $BASHDIR/.bash_functions

# Make a link to the alias and environment variables file
makesymlink $MYDIR/alias_vars_mario $BASHDIR/.alias_vars_mario
makesymlink $MYDIR/alias_vars_yoshi $BASHDIR/.alias_vars_yoshi
makesymlink $MYDIR/alias_vars_glen $BASHDIR/.alias_vars_glen
makesymlink $MYDIR/alias_vars_hazza $BASHDIR/.alias_vars_hazza
makesymlink $MYDIR/alias_vars_blank $BASHDIR/.alias_vars_blank


