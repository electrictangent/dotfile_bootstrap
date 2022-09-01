#!/usr/bin/env python3
#from subprocess import Popen,PIPE,STDOUT
import os
import sys

import glob

import random
import time

# Variables for wallpaper file location here (not implemented)

def generate_random_image():
#    currentPath = getPath()

    return 0


def main(pictures_path):
    pictures_directory_list = []
    extensions = ["png","jpg","jpeg","JPG","PNG","JPEG"]

    for x in extensions:
        print(x)
        print(pictures_path)
        temp_list = glob.glob("{}/*.{}".format(pictures_path,x))

        if temp_list != []:
            for y in temp_list:
                pictures_directory_list.append(y)

    # Create coloscheme and start poly (because i3wm is imcompetent at that)
    random_image = random.choice(pictures_directory_list)
    os.system("feh --bg-scale \"{0}\" \nwal -i \"{0}\" -n --saturate 0.75 -a 185 \n~/.config/polybar/launch.sh".format(random_image))    

    # Start inifinite cycling through pictures every 5 mins (300 secs)
    previous_image = random_image

    while True:
        random_image = random.choice(pictures_directory_list)

        if random_image != previous_image:
            os.system("feh --bg-scale \"{0}\" \nwal -i \"{0}\" -n --saturate 0.75 -a 185".format(random_image))
            previous_image = random_image
            time.sleep(300)
       	


if __name__ == '__main__':
    main(sys.argv[1])
