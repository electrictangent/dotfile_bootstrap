#!/bin/bash

rootdir=$1

if [ $2 = "start" ] 
then
	rand_sound=$(find ${rootdir} -name "*tartup.*" -type f | shuf -n 1)
	play "$rand_sound"
fi

if [ $2 = "stop" ] 
then
	rand_sound=$(find ${rootdir} -name "*hutdown.*" -type f | shuf -n 1)
	play "$rand_sound"
fi


exit 0
