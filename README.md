# Overview
My configurations of some Linux tool:
  - System Configure
  - NeoVIM
  - Tmux
  - Zsh

## System Configure

### Get this repository
```bash
$ git clone https://github.com/liyewen521/linux_tools.git
$ cd linux_tools
$ git submodule update --init
```

### change package source to Tsinghua or Aliyun, and add clangd-11 source
```bash
$ source system_prepare.sh
```

### set system configure(optical)
```bash
$ source common_configure.sh
```

## Neovim
```bash
$ cd neovim
$ source install_neovim.sh
```

# Tmux
```bash
$ source install_tmux.sh  
```

# Zsh
```bash
$ cd zsh
$ source install_zsh.sh  
```
