#!/bin/sh
while true ; do nc -l -p 80 -e $1 $2 ; done
