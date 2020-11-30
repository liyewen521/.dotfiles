#!/bin/bash

# Install my_neovim
git clone https://github.com/liyewen521/my_neovim.git .my_neovim

# Install neovim 
cd ~
wget https://github.com/neovim/neovim/releases/download/v0.4.4/nvim-linux64.tar.gz
tar -xvf nvim-linux64.tar.gz
echo ''                                       >> ~/.bashrc
echo '#Neovim'                                >> ~/.bashrc
echo 'export PATH=${PATH}:~/nvim-linux64/bin' >> ~/.bashrc
echo "alias vim='nvim' "                      >> ~/.bashrc
source ~/.bashrc

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim/
ln -s ~/.my_neovim/init.vim ~/.config/nvim/

# Install plugins 
apt install -y ctags      # for targar
# for coc.vim 
curl -sL install-node.now.sh/lts | bash  # version >= 10.12 
apt install -y npm 
apt install -y locales locales-all
pip install pynvim
echo 'export LC_ALL=en_US.UTF-8' >> ~/.bashrc  
echo 'export LANG=en_US.UTF-8'   >> ~/.bashrc
# install plugin
nvim -c "PlugInstall" -c "q" -c "q"
nvim -c 'CocInstall -sync coc-clangd coc-git coc-highlight coc-sh coc-java coc-cmake'

# Finish
echo "Finish!"
