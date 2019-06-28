#!/bin/bash
#########################################################################
# File Name: serve.sh
# Author: wenfeng
# mail: wenfengand@126.com
# Created Time: 2019-06-21 20:42:52
#########################################################################
TESTDATA="$(pwd)/voice"
# Start TensorFlow Serving container and open the REST API port
docker run  --rm \
    -p 8501:8501 \
    -v "$TESTDATA:/models/voice" \
    -e MODEL_NAME=voice \
    -d tensorflow/serving &
