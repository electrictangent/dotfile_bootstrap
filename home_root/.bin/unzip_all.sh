#!/bin/bash

rootdir=$1
webp_dir=( $( find ${rootdir} -name "*.zip" -type f ) )

echo "Extracting all zipfiles in directory $1"
echo

for file in "${webp_dir[@]}"
do
	echo "========== Unzipping $file =========="
	unzip $file
	echo 
	echo
done

exit 0
