#!/bin/sh

export UHOME="$(echo $(bash -c "cd ~${USER} && pwd"))"
export REPO=${UHOME}/src/venv

cd $UHOME

#terminal
mkdir -p $UHOME/.config/alacritty
rm -rf $UHOME/.config/alacritty/alacritty.yml
ln -s $REPO/alacritty/alacritty.yml $UHOME/.config/alacritty  

rm -rf $UHOME/.zshrc 
ln -s $REPO/.zshrc $UHOME

rm -rf $UHOME/.ctags
rm -rf $UHOME/.ctagsignore
ln -s $REPO/.ctags
ln -s $REPO/.ctagsignore

rm -rf $UHOME/.tmux.conf
ln -s $REPO/.tmux.conf $UHOME

mkdir -p $UHOME/.config/nvim
mkdir -p $UHOME/.config/nvim/plugin
mkdir -p $UHOME/.config/nvim/after/plugin

cd $UHOME
rm -rf $UHOME/.config/nvim/init.vim
cd $UHOME/.config/nvim
rm -rf *.vim
rm -rf *.json
ln -s $REPO/nvim/*.vim ./
ln -s $REPO/nvim/*.json ./

cd $UHOME
rm -rf .ssh/config
cd .ssh
ln -s $REPO/ssh/* ./

cd $UHOME
chmod -R 700 $UHOME/.ssh
chmod 600 $UHOME/.ssh/config
chmod 600 $UHOME/.ssh/*.*
chmod 644 $UHOME/.ssh/*.pub

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
pip install requests
npm i intelephense -g
