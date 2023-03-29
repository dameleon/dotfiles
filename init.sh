#!/usr/bin/env bash

set -e

cd $(dirname $0)

DOT_FILES=(.tmux.conf .zshrc .ideavimrc .zsh)

for dotfile in ${DOT_FILES[@]}; do
    filepath=$HOME/$dotfile
    if [ -e $filepath ]; then
        echo "File $filepath already exists. Skipping..."
        continue
    fi
    ln -s $PWD/$dotfile $filepath
done

# neovim
mkdir -p $HOME/.config/nvim
NVIM_FILES=$(find .config/nvim -regex ".*\.\vim")
for nvimfile in $NVIM_FILES; do
    filepath=$HOME/$nvimfile
    if [ -e $filepath ]; then
        echo "File $filepath already exists. Skipping..."
        continue
    fi
    ln -s $PWD/$nvimfile $HOME/$nvimfile
done

set +e

