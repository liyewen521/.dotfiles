# Overview
My configurations of some Linux tool:
  - NeoVIM
  - Tmux
  - Zsh

## System Configure
### Change Mirror to Tsinghua or Aliyun
```bash
$ sudo bash system_prepare.sh change_mirrors
```
### Change proxy to V2ray
```bash
$ source system_prepare.sh change_proxy # if only activate in current terminal
```
## Neovim
```bash
$ source system_prepare.sh # set proxy
$ source install_neovim.sh # install neovim
```

# Tmux
```bash
$ source system_prepare.sh # set proxy
$ source install_tmux.sh  
```

# Zsh
```bash
$ source system_prepare.sh # set proxy
$ source install_zsh.sh  
```

