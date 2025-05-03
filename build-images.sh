#! /bin/bash

if [ -z "$1" ]
  then
    echo "Error: need to provide tag for image"
    echo "Usage: ./build-images.sh latest"
    exit 1
fi


# create a custom builder to support multi-platform compiling
docker buildx create --name mybuilder

# set mybuilder as the new default, check the change effected
docker buildx use mybuilder
docker buildx inspect --bootstrap

# main build command: build and push images to DockerHub
docker buildx build . --platform=linux/amd64,linux/arm64/v8 -t cis548/docker-env:$1 --push
