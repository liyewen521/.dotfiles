#!/bin/bash

# get ubuntu version
function get_ubuntu_version()
{
    line=$(cat /etc/lsb-release | grep "DISTRIB_RELEASE")
    arr=(${line//=/ })
    version=(${arr[1]//./ })

    echo ${version[0]}
}

# system prepare for Ubuntu
function system_prepare_on_ubuntu() {
   
    sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup

    version=$(get_ubuntu_version)
    if [ $version -eq 16 ];then
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial main' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial main' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial universe' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial universe' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates universe' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-security main' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security universe' >> /etc/apt/sources.list "
    elif [ $version -eq 18 ];then
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' >> /etc/apt/sources.list "
    elif [ $version -eq 20 ];then
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse' >> /etc/apt/sources.list "
        sudo sh -c " echo 'deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse' >> /etc/apt/sources.list "
    else
    	echo "Invalid Version"
    fi
    sudo apt update
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

# system prepare for Linux
function system_prepare_on_linux() {
    
    distro=`get_linux_distribution`
    echo "Linux distro: "${distro}

    if [ ${distro} == "Ubuntu" ]; then
        system_prepare_on_ubuntu
    elif [ ${distro} == "Deepin" ]; then
        system_prepare_on_ubuntu_like
    elif [ ${distro} == "LinuxMint" ]; then
        system_prepare_on_ubuntu_like
    elif [ ${distro} == "elementaryOS" ]; then
        system_prepare_on_ubuntu_like
    elif [ ${distro} == "Debian" ]; then
        system_prepare_on_debian
    elif [ ${distro} == "Raspbian" ]; then
        system_prepare_on_debian
    elif [ ${distro} == "UOS" ]; then
        system_prepare_on_debian
    elif [ ${distro} == "Kali" ]; then
        system_prepare_on_debian
    elif [ ${distro} == "Parrot" ]; then
        system_prepare_on_parrot
    elif [ ${distro} == "CentOS" ]; then
        system_prepare_on_centos
    elif [ ${distro} == "fedora" ]; then
        system_prepare_on_fedora
    elif [ ${distro} == "openSUSE" ]; then
        system_prepare_on_opensuse
    elif [ ${distro} == "ArchLinux" ]; then
        system_prepare_on_archlinux
    elif [ ${distro} == "ManjaroLinux" ]; then
        system_prepare_on_archlinux
    elif [ ${distro} == "Gentoo" ]; then
        system_prepare_on_gentoo
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
function change_pkg_source(){

    begin=`get_now_timestamp`

    type=$(uname)
    echo "Platform type: "${type}

    if [ ${type} == "Darwin" ]; then
        system_prepare_on_mac
    elif [ ${type} == "FreeBSD" ]; then
        system_prepare_on_freebsd
    elif [ ${type} == "Linux" ]; then
        tp=$(uname -a)
        if [[ $tp =~ "Android" ]]; then
            echo "Android"
            system_prepare_on_android
        else
            system_prepare_on_linux
        fi
    else
        echo "Not support platform type: "${type}
    fi

    end=`get_now_timestamp`
    second=`expr ${end} - ${begin}`
    min=`expr ${second} / 60`
    echo "It takes "${min}" minutes."

}

function change_clangd-11_source(){
    linux_version_name=`lsb_release -sc`
    sudo sh -c " echo '# For clangd-11' >> /etc/apt/sources.list "
    sudo sh -c " echo 'deb http://apt.llvm.org/${linux_version_name}/ llvm-toolchain-${linux_version_name}-11 main' >> /etc/apt/sources.list "
    sudo sh -c " echo 'deb-src http://apt.llvm.org/${linux_version_name}/ llvm-toolchain-${linux_version_name}-11 main' >> /etc/apt/sources.list "i
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
    sudo apt update
}

function install_proxychains-ng(){
    root_path=${PWD}
    echo "$PWD"
    echo "$root_path"
    sudo apt install -y make gcc curl 
    cd ./3rd_Party/proxychains-ng/
    ./configure
    make
    cd $root_path
    echo '# For proxychains-ng' >> $HOME/.bashrc
    echo "alias pc4='$root_path/3rd_Party/proxychains-ng/proxychains4 -f $root_path/3rd_Party/proxychains.conf.lyw'" >> $HOME/.bashrc
    source $HOME/.bashrc
}

function main(){
    # change_pkg_source
    # change_clangd-11_source
    install_proxychains-ng
}

# invoke main function
main
