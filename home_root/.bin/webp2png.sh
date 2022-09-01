#!/bin/bash

rootdir=$1
webp_dir=( $( find ${rootdir} -name "*.webp" -type f ) )

echo "Extracting all webp files in directory $1"
echo

for file in "${webp_dir[@]}"
do
	pngfile=$(echo "$file" | sed "s/.webp/.png/g")
	echo "$file ---> $pngfile"
	dwebp "$file" -o "$pngfile"
done

exit 0
