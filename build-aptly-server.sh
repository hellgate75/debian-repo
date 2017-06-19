#!/bin/bash
if ! [[ -z "$(docker images | grep aptly-server | grep latest)" ]]; then
  docker rmi -f aptly-server:latest
fi
docker build --no-cache=true --rm --force-rm --tag aptly-server ./
