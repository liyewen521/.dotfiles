# Automated Dotfiles Setup Guide

This repository modularizes configuration for Bash, Vim, and Tmux. For a clean and consistent environment, follow the steps below in order:

## Install system packages

Install system packages with:
```bash
bash install_packages.sh
```

## 1. Auto-configure Bash

Install Oh My Bash for enhanced experience:
```bash
bash install_oh_my_bash.sh
```

Run the following to symlink bash configs and automatically update `.bashrc`:
```bash
bash setup_bash.sh
```

## 2. Auto-configure Vim

Symlink vim configuration with:
```bash
bash setup_vim.sh
```

## 3. Auto-configure Tmux

Symlink tmux configuration with:
```bash
bash setup_tmux.sh
```

