#!/bin/bash

rootdir=$1
webp_dir=( $( find "${rootdir}" -name "*.svg" -type f ) )

echo "Converting all svg files in directory $1"
echo

for file in "${webp_dir[@]}"
do
	pngfile=$(echo "$file" | sed "s/.svg/.png/g")
	echo "$file ---> $pngfile"
	convert +antialias "$file" "$pngfile"
done

exit 0
