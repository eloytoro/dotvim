#!/bin/bash
git clone https://github.com/gmarik/Vundle.vim bundle/Vundle.vim
ln -s vimrc ~/.vimrc
vim +PluginInstall +qall
