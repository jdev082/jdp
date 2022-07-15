#!/bin/bash
# jdpkg main file
# JaydenDev, MIT License, 2022
if [[ -z $1 ]]
then
    echo "Run this script with '-h' to see a list of arguments."
    exit 1
fi

if [[ ! -d /etc/jdpkg ]] 
then
    echo '/etc/jdpkg does not exist, creating...' && sudo mkdir /etc/jdpkg
fi

if [[ ! -d /etc/jdpkg/db ]]
then
    echo 'Downloading database...'
    sudo git clone https://github.com/JaydenDev/jdpkg-db /etc/jdpkg/db
fi

function help() {
    echo "./main.sh
-----------------------
-v, version
-h, help
-i, install
-u, update"
}

if [[ $1 == 'update' ]]
then
    echo 'Updating database!'
    sudo rm -rf /etc/jdpkg/db
    sudo git clone https://github.com/JaydenDev/jdpkg-db /etc/jdpkg/db
fi

if [[ $1 == '-h' ]]
then
    help
    exit
fi

if [[ $1 == 'install' ]]
then
    if [ -v "$1" ]
    then
        echo "./main.sh install <package>"
	exit
    fi

    if [[ ! -d /etc/jdpkg/db/$2 ]]
    then
        echo "package $2 does not exist in the repository."
        exit
    fi

    source /etc/jdpkg/db/$2/install.sh
    init || echo 'Install script failed at initializaiton.'
    get_source || echo 'Failed to download application source code.'
    cd /tmp/$RAND/git
    install || echo 'Failed to install.'
fi

if [[ $1 == 'uninstall' ]]
then
    if [ -v "$1" ]
    then
        echo "./main.sh uninstall <package>"
	exit
    fi

    if [[ ! -d /etc/jdpkg/db/$2 ]]
    then
        echo "package $2 does not exist in the repository."
        exit
    fi

    source /etc/jdpkg/db/$2/install.sh
    remove || echo 'Failed to install.'
fi
