#!/bin/bash

# --- Install my_neovim
# git clone https://github.com/liyewen521/my_neovim.git .my_neovim

# --- Install neovim 
cd ~
rm -rf nvim-linux64.tar.gz
wget https://github.com/neovim/neovim/releases/download/v0.4.4/nvim-linux64.tar.gz
tar -xvf nvim-linux64.tar.gz
echo ''                                       >> ~/.bashrc
echo '#Neovim'                                >> ~/.bashrc
echo 'export PATH=${PATH}:~/nvim-linux64/bin' >> ~/.bashrc
echo "alias vim='nvim' "                      >> ~/.bashrc
source ~/.bashrc
rm nvim-linux64.tar.gz

# --- Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim/
ln -sf ~/.my_neovim/init.vim ~/.config/nvim/

# --- Install plugins
# for targar
apt install -y ctags    
# for coc.vim 
curl -sL install-node.now.sh/lts | bash  # nodejs version >= 10.12 
apt install -y npm 
apt install -y locales locales-all
pip install pynvim
echo 'export LC_ALL=en_US.UTF-8' >> ~/.bashrc  
echo 'export LANG=en_US.UTF-8'   >> ~/.bashrc
# install plugin
nvim -c "PlugInstall" -c "q" -c "q"

# --- Finish
echo "Neovim install Finished!"
