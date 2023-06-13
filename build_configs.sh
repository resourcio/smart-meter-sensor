#!/bin/bash

echo -e "Starting Resourcio config build ..."
echo -e "Removing old script files ..."

# read all files from configs/templates folder
FILES="configs/templates/*.txt"
BUILD_FOLDER="build"
DEFAULT_SMART_METER="Logarex_LK13BE"

# get version string from file
INPUT=$(<version.txt)
VERSION_STRING=$(echo $INPUT| cut -d'=' -f 2)
echo -e "Build version: $VERSION_STRING" 

# create build folder
rm -rf build
mkdir build
cp autoexec.be $BUILD_FOLDER

# replace version number
sed -i '.bak' "s/%%%%%VERSION_PLACEHOLDER%%%%%/$VERSION_STRING/g" $BUILD_FOLDER/autoexec.be

# remove all comments from autoexec.be to reduce file size
sed -i '.bak' -e '/^[ \t]*#/d' $BUILD_FOLDER/autoexec.be


for f in $FILES ; 
do 
    if [[ "$f" == "configs/templates/_script.txt" ]] ; then
        continue
    fi

    if [ -f "$f" ]
    then
        echo "Processing $f file ..."
        # create for each file except _script a file in configs folder with content of _script file
        newFile="$(basename ${f})"
        cp `pwd`"/configs/templates/_script.txt" "$BUILD_FOLDER/${newFile}"; 
        # read content of smart meter file into variable
        # replace each files placeholder with matching content
        echo "Created file $BUILD_FOLDER/${newFile}"
        sed -i '.bak' "s/%%%%%VERSION_PLACEHOLDER%%%%%/$VERSION_STRING/g" "$BUILD_FOLDER/${newFile}"
        sed -i '' -e '/%%%%%SML_PLACEHOLDER%%%%%/ {' -e "r $f" -e 'd' -e '}' "$BUILD_FOLDER/${newFile}"
        # remove all comments from scripts to reduce file size
        sed -i '.bak' -e '/^[ \t]*;/d' "$BUILD_FOLDER/${newFile}"


    else
        echo "Warning: Some problem with \"$f\""
    fi
done

# create default config
cp "$BUILD_FOLDER/$DEFAULT_SMART_METER.txt" "$BUILD_FOLDER/script.txt"

#cleanup .bak files
rm -f $BUILD_FOLDER/*.bak 2> /dev/null 