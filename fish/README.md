# Fish Dotfiles

On top of the regular config.fish, I also have in here some alias
files, some colours files and some special functions.

The alias files are host dependent.

You can either do one of two things:
1. Copy the files manually into the ~/.config/fish folder (and the functions
   into the ~/.config/fish/functions folder)
2. Run ./copy_files.sh. This is a bash script that will make symbolic links
   in your ~/.config/fish directory to the repo, that way pulling into the
   repo automatically will update the fish files. If you had any old fish
   functions in ~/.config/fish, it will move these to a .old file.


