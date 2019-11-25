#!/bin/sh

export UHOME="$(echo $(bash -c "cd ~${USER} && pwd"))"
export REPO=${UHOME}/src/venv

cd $UHOME

rm -rf .zshrc 
ln -s $REPO/.zshrc

rm -rf .ctags
ln -s $REPO/.ctags

rm -rf .tmux.conf
ln -s $REPO/.tmux.conf

mkdir -p .config/nvim
rm -rf .config/nvim/init.vim
cd .config/nvim
rm -rf init.vim
ln -s $REPO/nvim/init.vim
cd ../../

rm -rf .ssh/config
cd .ssh
ln -s $REPO/.ssh/config
chmod 600 config


