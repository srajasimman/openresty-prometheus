#!/usr/bin/env bash
if [ $# -eq 0 ]
  then
    tag='latest'
  else
    tag=$1
fi

docker rmi srajasimman/$(basename $(pwd)):$tag ;\
docker build -t srajasimman/$(basename $(pwd)):$tag -t ghcr.io/srajasimman/$(basename $(pwd)):$tag . && \
docker push srajasimman/$(basename $(pwd)):$tag
docker push ghcr.io/srajasimman/$(basename $(pwd)):$tag