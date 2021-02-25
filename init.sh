#!/bin/sh

export UHOME="$(echo $(bash -c "cd ~${USER} && pwd"))"
export REPO=${UHOME}/src/venv

cd $UHOME

rm -rf .zshrc 
ln -s $REPO/.zshrc

rm -rf .ctags
rm -rf .ctagsignore
ln -s $REPO/.ctags
ln -s $REPO/.ctagsignore

rm -rf .tmux.conf
ln -s $REPO/.tmux.conf

mkdir -p .config/nvim
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin


rm -rf .config/nvim/init.vim
cd .config/nvim
rm -rf init.vim
rm -rf coc.plugin.vim
ln -s $REPO/nvim/init.vim
ln -s $REPO/nvim/coc.plugin.vim
cd ../../

rm -rf .ssh/config
cd .ssh
ln -s $REPO/.ssh/config

# vimplug 
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
