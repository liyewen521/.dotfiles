#!/bin/bash

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




