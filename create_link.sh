#!/bin/sh
cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != 'vimfiles' ] && [ $dotfile != '.gitmodules' ] && [ $dotfile != '.gitignore' ] && [ $dotfile != '.idea' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done
