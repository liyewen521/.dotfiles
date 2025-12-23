#!/bin/bash

# Install system packages
bash ${HOME}/.dotfiles/install_packages.sh

# Install oh-my-bash
bash ${HOME}/.dotfiles/install_oh_my_bash.sh

# Setup vim
bash ${HOME}/.dotfiles/setup_vim.sh

# Setup tmux
bash ${HOME}/.dotfiles/setup_tmux.sh

# Setup bash
bash ${HOME}/.dotfiles/setup_bash.sh
