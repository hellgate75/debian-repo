#!/bin/bash
if ! [[ -z "$(docker images | grep aptly-client | grep latest)" ]]; then
  docker rmi -f aptly-client:latest
fi
#docker build --no-cache=true --rm --force-rm --tag aptly-client ./
docker build --rm --force-rm --tag aptly-client ./
