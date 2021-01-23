#!/bin/bash

# Install oh-my-tmux
apt install -y tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .