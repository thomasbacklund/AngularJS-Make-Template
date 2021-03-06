#/bin/bash
# Author Thomas Backlund

# This script adds a new controller to the ng/ tree

templates=./tools/templates

if [ "$1" = "" ] || [ "$2" = "" ] || [ "$3" = "" ]; then
    echo "Usage $0 ModuleName pathRelative to ./ng controllerName"
    echo "Exampel: $0 BuildModule /build/mind mindController"
    exit 1
fi

modulename=$1
path="./ng"$2
name=$3

if [ ! -d $path ]; then
    echo "Directory $path does not exist, attempting to create it."
    mkdir -p $path
fi

cat $templates/controller/controller.js | sed "s/controllerName/$name/g" | sed "s/ModuleName/$modulename/g" > $path/${name}.js
echo Done
