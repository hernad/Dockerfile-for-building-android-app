#!/bin/bash

if ! docker images android-dev | grep -q android-dev
then
  docker build -t android-dev .
fi

GITHUB_USER=hernad
ANDROID_PROJECT=H4-android

docker rm -f android-build-$ANDROID_PROJECT

docker run -ti \
       	-v $(pwd)/dot.android:/root/.android \
       	-v $(pwd)/build:/build \
       	-v $(pwd)/apk:/apk \
	-v $(pwd)/build_apk.sh:/build_apk.sh \
       	--name android-dev android-dev /build_apk.sh



cp -av apk/*.apk .
