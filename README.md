# Overview
My configurations of some Linux tool:
  - System Configure
  - NeoVIM
  - Tmux
  - Zsh

## System Configure
### change package source to Tsinghua or Aliyun, and add clangd-11 source
```bash
$ sudo bash system_prepare.sh
```
### set system configure
```bash
$ source common_configure.sh
```
## Neovim
```bash
$ cd neovim
$ set_my_vpn
$ source install_neovim.sh # install neovim
```

# Tmux
```bash
$ source system_prepare.sh # set proxy
$ source install_tmux.sh  
```

# Zsh
```bash
$ cd zsh
$ source system_prepare.sh # set proxy
$ source install_zsh.sh  
```

