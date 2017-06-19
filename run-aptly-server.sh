#!/bin/bash
if ! [[ -z "$(docker ps -a | grep aptly-deb)" ]]; then
  docker rm -f aptly-deb
  docker volume rm -f data
fi
if [[ -e ./aptly-data ]]; then
  rm -Rf ./aptly-data
fi
mkdir -p ./aptly-data
docker run -d --name aptly-deb -v aptly-data:/aptly -p 9999:9999 aptly-server:latest
