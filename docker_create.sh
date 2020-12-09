#!/bin/bash

# Install neovim
apt update && apt upgrade
apt install -y vim git wget curl python3-pip python-pip
export ALL_RPOXY=socks5://10.18.83.170:10808
export https_proxy=http://10.18.83.170:10809
export http_proxy=http://10.18.83.170:10809
cd ~
git clone https://github.com/liyewen521/my_neovim.git
cd my_neovim
bash install.sh

# Install oh-my-tmux
apt install -y tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# Install oh-my-zsh
apt install -y zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)
echo ''                                       >> ~/.zshrc
echo '#Neovim'                                >> ~/.zshrc
echo 'export PATH=${PATH}:~/nvim-linux64/bin' >> ~/.zshrc
echo "alias vim='nvim' "                      >> ~/.zshrc
echo 'export LC_ALL=en_US.UTF-8'              >> ~/.zshrc  
echo 'export LANG=en_US.UTF-8'                >> ~/.zshrc




