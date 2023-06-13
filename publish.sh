#!/bin/bash

folderName="smartmetersensor"
CONFIGS_PATH="tmp/$folderName/configs"
FIRMWARE_PATH="tmp/$folderName/"

# package
rm publish.zip
mkdir 'tmp'
mkdir "tmp/$folderName"

# config files
./build_configs.sh
mkdir $CONFIGS_PATH
cp build/* $CONFIGS_PATH
cp version.txt $FIRMWARE_PATH

# firmware image
./build_firmware.sh
cp -r firmware/docker-tasmota/Tasmota/build_output/firmware $FIRMWARE_PATH

# server
cp -r server/ tmp

# zip
cd tmp
zip ../publish.zip -r ./*
cd ..
rm -rf 'tmp'

