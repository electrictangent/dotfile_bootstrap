#!/bin/bash
mpc_output=$(mpc -h localhost -p 10000 status)

if [[ $mpc_output == *"playing"* ]]; then
    mpc -h localhost -p 10000 pause
fi

if [[ $mpc_output != *"playing"* ]]; then
    mpc -h localhost -p 10000 play
fi 
