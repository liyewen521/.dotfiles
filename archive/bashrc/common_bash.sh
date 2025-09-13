# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

############################################################## Individual Setting ###########################################################################
# System 
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
PATH=${PATH}:/usr/sbin

#  For Deep Learning(cuda, cudnn, and anaconda3)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# cuda9.2.148 + cudnn7.6.3
# export CUDA_HOME=$HOME/Apps/cuda-9.0
# export PATH=$PATH:$CUDA_HOME/bin
# export LD_LIBRARY_PATH=$HOME/Apps/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# cuda11.1
export CUDA_VERSION=111
export CUDA_HOME=$HOME/Apps/cuda-11.1
export PATH=$PATH:$CUDA_HOME/bin
export LD_LIBRARY_PATH=$HOME/Apps/cuda-11.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/Apps/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/Apps/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/Apps/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/Apps/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# For Analyzing Codes
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# vtune 
# source ~/Apps/intel/vtune_profiler_2020.2.0.610396/vtune-vars.sh
# The project path is $HOME/intel/vtune/projects/

# For Xilinx
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# source $HOME/Apps/Xilinx2016.4/Vivado/2016.4/settings64.sh

# For RISC-V
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
# export PATH=/opt/riscv/bin:$PATH
# export export RISCV=$HOME/Codes/rocket-tools/riscv-gnu-toolchain

# For chisel
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
## verilator
# export PATH=${PATH}:${HOME}/Apps/Verilator/bin
# other dependence: sbt, java

# For system language
# ------------------------------------------------------------------------------------------------------------------------------------------------------------
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
# You can use 'locale' command to see system language settings, then you can change some variables purposefully.

# For IDEA, Clion
# ------------------------------------------------------------------------------------------------------------------------------------------------------------
# alias idea='$HOME/Apps/idea-IU-203.6682.168/bin/idea.sh'
# alias clion='$HOME/Apps/clion-2020.3.2/bin/clion.sh'

# For java
# ------------------------------------------------------------------------------------------------------------------------------------------------------------
# export JAVA_HOME=$HOME/Apps/jdk8u275-b01
# export JRE_HOME=${JAVA_HOME}/jre
# export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
# export PATH=${JAVA_HOME}/bin:$PATH

# For proxychains-ng
# ------------------------------------------------------------------------------------------------------------------------------------------------------------
alias pc4='$HOME/Apps/pc4/proxychains-ng/proxychains4 -f $HOME/Apps/pc4/proxychains.conf.lyw'

# For exa
# ------------------------------------------------------------------------------------------------------------------------------------------------------------
alias exa="$HOME/Apps/exa-linux-x86_64"

# For Matlab
# ------------------------------------------------------------------------------------------------------------------------------------------------------------
# alias matlab="$HOME/Disk1Apps/Matlab_R2021a/bin/matlab"

# For Neovim
# -----------------------------------------------------------------------------------------------------------------------------------------------------------
alias vim="${HOME}/Apps/nvim.appimage"
alias vim_np="${HOME}/Apps/nvim.appimage --noplugin"
alias vim_pc4="pc4 ${HOME}/Apps/nvim.appimage"

# Common alias
# ------------------------------------------------------------------------------------------------------------------------------------------------------------
alias edit_sh="vim $HOME/.bashrc"
alias sour_sh="source $HOME/.bashrc"
alias lst="exa -lT"
alias lsa="exa -la --git -g"
############################################################## Individual Setting ############################################################################