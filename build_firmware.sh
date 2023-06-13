#!/bin/bash

TASMOTA_TAG="v12.3.1"
TASMOTA_BRANCH=master

# get version string from file
INPUT=$(<version.txt)
VERSION_STRING=$(echo $INPUT| cut -d'=' -f 2)
echo -e "Build version: $VERSION_STRING" 

#git fetch --all --tags
# check if folder exists
echo -e "Starting Resourcio firmware build ..."
if test -d `pwd`"/firmware/docker-tasmota"; then
    echo -e "docker-tasmota already cloned"
    chmod +x firmware/docker-tasmota/compile.sh
    
else
    echo -e "Checking docker-tasmota GitHub for the most recent development version"
    mkdir firmware
    cd firmware
    git clone https://github.com/tasmota/docker-tasmota.git 
    git fetch https://github.com/tasmota/docker-tasmota.git development
    
    git reset --hard origin/$TASMOTA_BRANCH > /dev/null 2>&1
    git pull origin $TASMOTA_BRANCH > /dev/null 2>&1
    cd ..
fi

if [ -z "$TASMOTA_BRANCH" ]; then
    echo -e "Failed to fetch/set docker-tasmota branch! Check internet connection and try again."
    exit 1
fi

# reset local changes in tasmota firmware working copy
cd firmware/docker-tasmota
git reset --hard origin/$TASMOTA_BRANCH > /dev/null 2>&1
# git restore .
# git clean -f
cd ../..

# replace target branch in compile script
sed -i '' "s/TASMOTA_BRANCH=development/TASMOTA_BRANCH=$TASMOTA_BRANCH/g" firmware/docker-tasmota/compile.sh

# add script to compile script which adds header - inception style
sed -i '' -e '/cd \$rundir/ {' -e "r add_footer.sh" -e 'd' -e '}' firmware/docker-tasmota/compile.sh

# set version number in compile script
sed -i '' "s/%%%%%VERSION_PLACEHOLDER%%%%%/$VERSION_STRING/g" firmware/docker-tasmota/compile.sh


if [[ "$(type -t docker)" == "file" ]] ; then
    echo "Copy configuration files ..."
    cp platformio_override.ini firmware/docker-tasmota/platformio_override.ini
    cp user_config_override.h firmware/docker-tasmota/user_config_override.h
    cp build/autoexec.be firmware/docker-tasmota/autoexec.be
    cp build/script.txt firmware/docker-tasmota/script.txt
    cd firmware/docker-tasmota/
    ./compile.sh
else
    echo -e "\nNo Docker detected. Please install docker:\n\n\tcurl -fsSL https://get.docker.com -o get-docker.sh\n\tsh get-docker.sh\n"
    # fi
fi