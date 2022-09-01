#!/usr/bin/env python3

import sys
import requests
import urllib.request


for x in range(int(sys.argv[1]), int(sys.argv[2])):
    url = "http://192.168.1.{}".format(x)
    try:
        url = "http://192.168.1.{}".format(x)
        response = requests.get(url)
        print(response)
    except OSError:
        print("No route to host for",url)

