#!/bin/bash

docker rm -f android-dev

docker run -ti \
       	-v $(pwd)/dot.android:/root/.android \
       	-v $(pwd)/build:/build \
       	--name android-dev android-dev bash

