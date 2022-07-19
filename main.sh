#!/bin/bash
# jdpkg main file
# JaydenDev, MIT License, 2022

# identify OS and pass to package
if [ "$(uname)" = "Darwin" ]; then
    export osType="darwinSystem"        
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    export osType="linuxSystem"
fi

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
    echo "jdpkg
-----------------------
-v, version
-h, help
install, install
update, update"
}

if [[ $1 == '-v' ]]
then
    echo 'jdpkg v1.0.0-devPreview'
    exit 0
fi

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
RAND=$RANDOM
export instdir = /tmp/$RAND
mkdir /tmp/$RAND
cd /tmp/$RAND
then
    if [ "$(uname)" = "Darwin" ]; then
        if [[ $mac_support = 0 ]]
        then
            echo "This software does not support your OS [MacOS/Darwin]."
            exit 1
        else
            echo "This package supports your system"
        fi     
fi

    if [ -v "$1" ]
    then
        echo "jdpkg install <package>"
	exit
    fi

    if [[ ! -d /etc/jdpkg/db/$2 ]]
    then
        echo "package $2 does not exist in the repository."
        exit
    fi

    source /etc/jdpkg/db/"$2"/install.sh
    git clone $sources $instdir/git || echo 'Failed to download application source code.'
    cd $instdir/git >& /dev/null || exit
    install >& /dev/null || echo 'Failed to install.'
fi

if [[ $1 == 'uninstall' ]]
then
    if [ -v "$1" ]
    then
        echo "jdpkg uninstall <package>"
	exit
    fi

    if [[ ! -d /etc/jdpkg/db/$2 ]]
    then
        echo "package $2 does not exist in the repository."
        exit
    fi

    source /etc/jdpkg/db/"$2"/install.sh
    remove || echo 'Failed to install.'
fi

if [[ $1 == '-t' ]]
echo '-t flag is not recommended as its in alpha state'
then
	if [[ -v $2 ]]
	then
		echo 'Provide path to package (must be in directory)'
	fi
	cd "$2" || echo 'Invalid package path' && exit 1
	source install.sh
    git clone $sources dir 
    cd dir
	install
	exit 0
fi
