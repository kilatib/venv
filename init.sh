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

cd $UHOME
rm -rf .config/nvim/init.vim
cd .config/nvim
rm -rf *.vim
rm -rf *.json
ln -s $REPO/nvim/*.vim ./
ln -s $REPO/nvim/*.json ./

cd $UHOME
rm -rf .ssh/config
cd .ssh
ln -s $REPO/ssh/* ./

cd $UHOME
chmod -R 700 .ssh
chmod 600 ./ssh/config
chmod 600 ./ssh/*.*
chmod 644 ./ssh/*.pub

# vimplug 
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# nerd font
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
python3 -m pip install --user --upgrade pynvim


# to have welldone folders in coc-exployer please set Hack Regular Nerd Font Complete font for terminal 



# FZF

brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
brew install ripgrep
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install the_silver_searcher
brew install fd
