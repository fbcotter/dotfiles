#!/bin/bash

mkdir -p $HOME/temp
pushd $HOME/temp
git clone --depth=1 https://github.com/oh-my-fish/oh-my-fish.git
oh-my-fish/bin/install --offline --noninteractive
# /bin/rm -rf oh-my-fish
popd
# make sure the prompt is clear
/bin/rm ~/.config/fish/functions/fish_prompt.fish || true
# fish -c "omf theme bobthefish"
# exec fish
