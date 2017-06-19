#!/bin/bash
if ! [[ -z "$(docker ps -a | grep aptly-cli)" ]]; then
  docker rm -f aptly-cli
  docker volume rm -f data
fi
if [[ -e ./aptly-data ]]; then
  rm -Rf ./aptly-data
fi
mkdir -p ./aptly-data
docker run -d -e "REPO_ADDRESS=$(hostname)" --hostname localhost --name aptly-cli -v aptly-data:/aptly aptly-client:latest
