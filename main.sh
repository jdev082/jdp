#!/bin/bash
# jdpkg main file
# JaydenDev, MIT License, 2022
JDPKG_ROOT=~/.local/share/jdp
mkdir -p $JDPKG_ROOT
source jdp.conf

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

function help() {
    echo "jdp
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
    for i in "${repos[@]}"
    do    
        rm -rf "$JDPKG_ROOT/$i"
        git clone "https://github.com/$i" "$JDPKG_ROOT/$i"
    done
    exit 0
fi

if [[ $1 == '-h' ]]
then
    help
    exit
fi

if [[ $1 == 'install' ]]
then
    for i in "${repos[@]}"
    do
        if [ -f "$JDPKG_ROOT/$i/$2/Makefile" ]
        then
            echo "Package exists in $i, installing..."
            make -C "$JDPKG_ROOT/$i/$2" install
        else
            echo "Package does not exist in $i!"
        fi
    done
fi

if [[ $1 == 'uninstall' ]]
    then
        if [ -f "$JDPKG_ROOT/${repos[@]}/$2/Makefile" ]
    then
        echo "Package exists in ${repos[@]}, installing..."
        cd "$JDPKG_ROOT/${repos[@]}/$2"
        make uninstall
        exit 0
    else 
        echo "Package invalid, does not exist, or has an invalid Makefile."
        exit 1
    fi
fi
