#!/bin/bash
DEBIAN_REPO="$DEB_REPO_NAME"
MIRROR_REPO="$MIRROR_REPO_NAME"
if ! [[ -z "$1"  ]]; then
  aptly repo add "$DEBIAN_REPO" "$1"
  aptly mirror update -ignore-signatures=true "$MIRROR_REPO"
  echo -e "Debian package $1 correctly deployed on $DEBIAN_REPO and mirrored on $MIRROR_REPO"
  exit 0
else
  echo "No suitable debian file to deploy to mirroring repository"
  exit 1
fi
