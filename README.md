# fbcotter/dotfiles

Repository to allow quick and mobile environment set up on new machines.

Several of the dotfiles were copied from mathiasbynens/dotfiles.

Apart from being extremely custom, as everyone else's dotfiles are, I think you
may find the ./copy_files.sh in many of the subfolders useful.

## General Description
My preferred editor is vim, my preferred shell is fish (although I do have some
bash settings), and I also like to use:
* tmux (rather than screen)
* latex
* brew (one of my machines is a mac)
* jupyter

You will see in many of my folders a script file called **copy_files.sh**. The
purpose of this is to symlink dotfiles in my home directory (or wherever they
are supposed to live) to my repo. The benefit of this is that if I make
a change on one machine and push it to my github, I can then just pull it on
the other machine and the dotfile is automatically updated.

### Bash folder
**Run ./copy_files.sh to automatically set up bash shell**
In here I have 10 files:
* alias_vars_x Are machine specific aliases and enviornment variables
* bash_aliases Are general aliases
* bash_functions Are some general bash functions to make life easier
* bash_profile My .bash_profile file. This loads in all of the other bash files
* bash_prompt My .bash_prompt file
* bashrc My bashrc file (I try to keep this one empty and have everything in
    bash_prompt)
* copy_files.sh Symlinks all the bash files to the home directory. Also checks
    the machine name for which alias_vars_x file to use.


### Brew folder
This was basically entirely copied from Mathias and hasn't changed much


### Fish Folder
**Run ./copy_files.sh to automatically set up fish shell**
* alias_vars_x Same as with bash, but fish style
* config.fish Pretty minimal config.fish file. I use oh-my-fish to nicen up my
    prompt so make sure you install that
* copy_files.fish Symlinks the alias_vars_x file, the config.fish file and the
    functions to the ~/.config/fish folder. It will call the install_omf.sh
    script if it detects that oh-my-fish is missing.
* install_omf.sh Not thoroughly test script. Attempts to download and install
    oh-my-fish. If you are having problems with it, it's not difficult to visit
    the repo and do manually, I just wanted the fully automated approach.
* functions/ A folder of some fish functions, in particular one to start the
    ssh agent.

### Git Template
My git template folder. My .gitconfig and .gitignore are not in here, this was
just for hooks.

### Home
**Run ./copy_files.sh to automatically link assortment of dotfiles**
Lots of config files that don't fit into a particular folder of their own. E.g.
* .vimrc and .gvimrc
* .ctags
* .gitattributes and .gitconfig and .gitignore
* .latexmkrc latexmk config file
* .tmux.conf tmux config file
* .wgetrc file
* Others

### Jupyter
Some jupyter settings. I don't have a copy_files.sh for these as I don't use
jupyter that much.

### Latex
**Run ./copy_files.sh to automatically set up latex files**
A defs.tex and preamble.tex file. I have tried to make these as general as
possible for my tex projects. Note that the copy_files.sh script will symlink
both of these files to ~/mylatex. My ~/.vimrc file will then add this to the
TEXINPUTS environment variable. That way, in my latex projects, I can have the
simple header:

```
\documentclass{article}
\input{preamble}
\input{defs}
\begin{document}

\end{document}
```

Rather than having a gigantic preamble every time.

### Repo List
A poorly maintained attempt at keeping track of what repos I have on my
machines (in case one of them ever dies)

### ssh
**Run ./copy_files.sh to automatically set up ssh files**
A folder with my ssh config for my different machines. Again, these are
symlinked.
