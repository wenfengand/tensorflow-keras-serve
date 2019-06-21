#!/bin/bash
#########################################################################
# File Name: serve.sh
# Author: wenfeng
# mail: wenfengand@126.com
# Created Time: 2019-06-21 20:42:52
#########################################################################
TESTDATA="$(pwd)/deploy"
# Start TensorFlow Serving container and open the REST API port
docker run  --rm \
    -p 8501:8501 \
    -v "$TESTDATA:/models/fashion_mnist" \
    -e MODEL_NAME=fashion_mnist \
    -d tensorflow/serving &
