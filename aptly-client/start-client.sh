#!/bin/bash
if [[ -e /root/install-debian-repo.sh ]]; then
  /root/install-debian-repo.sh
fi
if ! [[ -e /root/aptly.done ]]; then
  echo "Installing debian-mirror ..."
  aptly mirror create -ignore-signatures=true "$MIRROR_REPO_NAME" "http://$REPO_ADDRESS:$REPO_PORT" "$DISTRIBUTION" "$COMPONENTS"
  aptly mirror update -ignore-signatures=true "$MIRROR_REPO_NAME"
  touch /root/aptly.done
fi
echo "Waiting forever ..."
tail -f /dev/null
