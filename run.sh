#!/bin/bash
DIR1="`dirname $BASH_SOURCE`"
MYDIR=`readlink -f "$DIR1"`
docker run --rm \
    -v $MYDIR:/workspace \
    -p 8501:8501 \
    -it  wenfengand/deepo:keras-py36-tf1.13.1 /bin/bash 
