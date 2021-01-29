#!/bin/bash


# get date
function get_datetime()
{
    time=$(date "+%Y%m%d%H%M%S")
    echo $time
}

# determine file exist or not
function is_exist_file()
{
    filename=$1
    if [ -f $filename ]; then
        echo 1
    else
        echo 0
    fi
}

# determine directory exist or not
function is_exist_dir()
{
    dir=$1
    if [ -d $dir ]; then
        echo 1
    else
        echo 0
    fi
}

# backup .vimrc file
function backup_vimrc_file()
{
    old_vimrc=$HOME"/.vimrc"
    is_exist=$(is_exist_file $old_vimrc)
    if [ $is_exist == 1 ]; then
        time=$(get_datetime)
        backup_vimrc=$old_vimrc"_bak_"$time
        read -p "Find "$old_vimrc" already exists, backup "$old_vimrc" to "$backup_vimrc"? [Y/N] " ch
        if [[ $ch == "Y" ]] || [[ $ch == "y" ]]; then
            cp $old_vimrc $backup_vimrc
        fi
    else
	    echo "INFO: No .vimrc file found, don't need to back up"
    fi
}

# backup init.vim file
function backup_initvim_file()
{
    old_initvim=$HOME"/.config/nvim/init.vim"
    is_exist=$(is_exist_file $old_initvim)
    if [ $is_exist == 1 ]; then
        time=$(get_datetime)
        backup_initvim=$old_initvim"_bak_"$time
        read -p "Find "$old_initvim" already exists, backup "$old_initvim" to "$backup_initvim"? [Y/N] " ch
        if [[ $ch == "Y" ]] || [[ $ch == "y" ]]; then
            cp $old_initvim $backup_initvim
        fi
    else
 	    echo "INFO: No init.vim file found, don't need to back up"
    fi
}

# backup old vim files
function backup_vimfiles() {
    backup_vimrc_file  # for vim  
    backup_initvim_file  # for neovim
}

# get ubuntu version
function get_ubuntu_version()
{
    line=$(cat /etc/lsb-release | grep "DISTRIB_RELEASE")
    arr=(${line//=/ })
    version=(${arr[1]//./ })

    echo ${version[0]}
}

# install needed softwares
function install_prepare_software_on_ubuntu()
{
    export ALL_PROXY=socks5://10.18.83.170:10808
    export http_proxy=http://10.18.83.170:10809
    export https_proxy=http://10.18.83.170:10809
    
    sudo apt update

    echo "INFO: Install required software on Ubuntu"
    version=$(get_ubuntu_version)
    if [ $version -eq 14 ];then
        sudo apt install -y cmake3
    else
        sudo apt install -y cmake
    fi

    # sudo apt install -y ctags build-essential python python-dev python3-dev python3-pip fontconfig libfile-next-perl ack-grep git curl wget 
    sudo apt install -y ctags python3 python3 python3-pip curl wget git

    # for coc.vim 
    curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
    sudo apt install -y nodejs
    sudo apt install -y npm
    sudo apt install -y cscope
    sudo apt install -y locales locales-all
    pip3 install pynvim
    
    echo "INFO: Install required software finished"
}

# install neovim
function begin_install_neovim() {
    
    # install neovim using source
    sudo apt install -y neovim
    echo ''                          >> $HOME/.bashrc
    echo '#Neovim'                   >> $HOME/.bashrc
    echo "alias vim='nvim' "         >> $HOME/.bashrc
    echo 'export LC_ALL=en_US.UTF-8' >> $HOME/.bashrc
    echo 'export LANG=en_US.UTF-8'   >> $HOME/.bashrc
    source $HOME/.bashrc

    # install vim-plug
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    mkdir -p $HOME/.config/nvim/
    ln -sf ${PWD}/init.vim $HOME/.config/nvim/

    # install plugins
    nvim -c "PlugInstall" -c "q" -c "q"

    # finish
    echo "INFO: Neovim install Finished !"
}

# install neovim on ubuntu
function install_neovim_on_ubuntu()
{
    backup_vimfiles
    install_prepare_software_on_ubuntu
    # export ALL_PROXY=socks5://10.18.83.170:10808
    # export http_proxy=http://10.18.83.170:10809
    # export https_proxy=http://10.18.83.170:10809
    begin_install_neovim
    # echo ${PWD}
    # echo `dirname $(readlink -f "$0")`
    # mkdir -p $HOME/.config/nvim/
    # ln -s ${PWD}/init.vim $HOME/.config/nvim/
}

# get linux distributions
function get_linux_distribution()
{
    if grep -Eq "Ubuntu" /etc/*-release; then
        echo "Ubuntu"
    elif grep -Eq "Deepin" /etc/*-release; then
        echo "Deepin"
    elif grep -Eq "Raspbian" /etc/*-release; then
        echo "Raspbian"
    elif grep -Eq "uos" /etc/*-release; then
        echo "UOS"
    elif grep -Eq "LinuxMint" /etc/*-release; then
        echo "LinuxMint"
    elif grep -Eq "elementary" /etc/*-release; then
        echo "elementaryOS"
    elif grep -Eq "Debian" /etc/*-release; then
        echo "Debian"
    elif grep -Eq "Kali" /etc/*-release; then
        echo "Kali"
    elif grep -Eq "Parrot" /etc/*-release; then
        echo "Parrot"
    elif grep -Eq "CentOS" /etc/*-release; then
        echo "CentOS"
    elif grep -Eq "fedora" /etc/*-release; then
        echo "fedora"
    elif grep -Eq "openSUSE" /etc/*-release; then
        echo "openSUSE"
    elif grep -Eq "Arch Linux" /etc/*-release; then
        echo "ArchLinux"
    elif grep -Eq "ManjaroLinux" /etc/*-release; then
        echo "ManjaroLinux"
    elif grep -Eq "Gentoo" /etc/*-release; then
        echo "Gentoo"
    else
        echo "Unknow"
    fi
}

# install neovim on linux
function install_neovim_on_linux()
{
    distro=`get_linux_distribution`
    echo "Linux distro: "${distro}

    if [ ${distro} == "Ubuntu" ]; then
        install_neovim_on_ubuntu
    elif [ ${distro} == "Deepin" ]; then
        install_neovim_on_ubuntu_like
    elif [ ${distro} == "LinuxMint" ]; then
        install_neovim_on_ubuntu_like
    elif [ ${distro} == "elementaryOS" ]; then
        install_neovim_on_ubuntu_like
    elif [ ${distro} == "Debian" ]; then
        install_neovim_on_debian
    elif [ ${distro} == "Raspbian" ]; then
        install_neovim_on_debian
    elif [ ${distro} == "UOS" ]; then
        install_neovim_on_debian
    elif [ ${distro} == "Kali" ]; then
        install_neovim_on_debian
    elif [ ${distro} == "Parrot" ]; then
        install_neovim_on_parrot
    elif [ ${distro} == "CentOS" ]; then
        install_neovim_on_centos
    elif [ ${distro} == "fedora" ]; then
        install_neovim_on_fedora
    elif [ ${distro} == "openSUSE" ]; then
        install_neovim_on_opensuse
    elif [ ${distro} == "ArchLinux" ]; then
        install_neovim_on_archlinux
    elif [ ${distro} == "ManjaroLinux" ]; then
        install_neovim_on_archlinux
    elif [ ${distro} == "Gentoo" ]; then
        install_neovim_on_gentoo
    else
        echo "Not support linux distro: "${distro}
    fi
}

# get current time
function get_now_timestamp()
{
    cur_sec_and_ns=`date '+%s-%N'`
    echo ${cur_sec_and_ns%-*}
}

# main function
function main()
{
    begin=`get_now_timestamp`

    type=$(uname)
    echo "Platform type: "${type}

    if [ ${type} == "Darwin" ]; then
        install_neovim_on_mac
    elif [ ${type} == "FreeBSD" ]; then
        install_neovim_on_freebsd
    elif [ ${type} == "Linux" ]; then
        tp=$(uname -a)
        if [[ $tp =~ "Android" ]]; then
            echo "Android"
            install_neovim_on_android
        else
            install_neovim_on_linux
        fi
    else
        echo "Not support platform type: "${type}
    fi

    end=`get_now_timestamp`
    second=`expr ${end} - ${begin}`
    min=`expr ${second} / 60`
    echo "It takes "${min}" minutes."
}

# invoke main function
main
