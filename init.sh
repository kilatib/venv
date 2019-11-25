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
rm -rf coc.plugin.vim
ln -s $REPO/nvim/init.vim
ln -s $REPO/nvim/coc.plugin.vim
cd ../../

rm -rf .ssh/config
cd .ssh
ln -s $REPO/.ssh/config
chmod 600 config

git config --global init.templatedir "${UHOME}/.git_template"
mkdir -p ${UHOME}/.git_template/hooks

rm -rf .git_template/hooks/ctags
cd .git_template/hooks 
ln -s $REPO/git/hooks/ctags

