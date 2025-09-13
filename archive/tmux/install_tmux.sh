#!/bin/bash

# Install oh-my-tmux 
apt install -y tmux

# or use portable tmux
curl -s https://api.github.com/repos/nelsonenzo/tmux-appimage/releases/latest | grep "browser_download_url.*appimage" | cut -d : -f 2,3 | tr -d \" | wget -qi - && chmod +x tmux.appimage
alias tmux="$HOME/tmux.appimage"

# Use tmux configuration
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .