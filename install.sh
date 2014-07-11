#!/bin/bash
git submodule update --init
ln -s vimrc ~/.vimrc
vim +PluginInstall +qall
