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
case $HOSTNAME in
    (yoshi) 
        echo "Host detected as yoshi. Copying the yoshi aliases file"
        makesymlink $MYDIR/alias_vars_yoshi $BASHDIR/.bash_host_alias;;
    (mario) 
        echo "Host detected as mario. Copying the mario aliases file"
        makesymlink $MYDIR/alias_vars_mario $BASHDIR/.bash_host_alias;;
    (Glen) 
        echo "Host detected as Glen. Copying the Glen aliases file"
        makesymlink $MYDIR/alias_vars_glen $BASHDIR/.bash_host_alias;;
    (hazza) 
        echo "Host detected as hazza. Copying the hazza aliases file"
        makesymlink $MYDIR/alias_vars_hazza $BASHDIR/.bash_host_alias;;
    (*) 
        echo "Warning - Unkown Hostname. Blank alias file copied" && \
        makesymlink $MYDIR/alias_vars_blank.fish $BASHDIR/alias_vars.fish;;
esac


