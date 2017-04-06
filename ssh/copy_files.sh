#!/bin/bash
MYDIR=$( cd $(dirname $0) ; pwd -P )
SSHDIR="$HOME/.ssh"

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
mkdir -p $SSHDIR

# Make a link to the ssh config files
HOSTNAME=$(hostname)
case $HOSTNAME in
    (mario) 
        echo "Host detected as mario. Copying the mario ssh config file";;
    (yoshi) 
        echo "Host detected as yoshi. Copying the yoshi ssh config file";;
    (luigi) 
        echo "Host detected as luigi. Copying the luigi ssh config file";;
    (Glen) 
        echo "Host detected as Glen. Copying the Glen ssh config file";;
    (hazza) 
        echo "Host detected as hazza. Copying the hazza ssh config file";;
esac
makesymlink $MYDIR/"$HOSTNAME"_config $SSHDIR/config

