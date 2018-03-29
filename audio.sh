#!/bin/bash


# Set audio levels
amixer -c 0 cset numid=6 78%
sleep 1
amixer -c 0 cset numid=4 12%
sleep 1

