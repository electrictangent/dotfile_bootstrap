#!/usr/bin/env bash

sudo chmod a+rw /dev/ttyACM0
sudo udevadm trigger
