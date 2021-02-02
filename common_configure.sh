#!/bin/bash

# For VPN
# ------------------------------------------------------------------------------------------------------------------------------------------------------------
alias set_my_vpn='export ALL_RPOXY=socks5://10.18.83.170:10808 && export https_proxy=http://10.18.83.170:10809 && export http_proxy=http://10.18.83.170:10809'
alias unset_my_vpn='unset ALL_RPOXY && unset https_proxy && unset http_proxy'

# For Language
# ------------------------------------------------------------------------------------------------------------------------------------------------------------
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

