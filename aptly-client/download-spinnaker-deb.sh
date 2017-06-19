#!/bin/bash
#apt-get update && 
#gem install --user-install deb-s3
PATH=$(echo ~/.gem/ruby/*/bin):$PATH

# Download spinnaker packages from bintray
for package in spinnaker-clouddriver spinnaker-deck spinnaker-echo spinnaker-front50 spinnaker-gate spinnaker-igor spinnaker-orca spinnaker-rosco; do
  DISTRIB_CODENAME="trusty"
  REPOSITORY_URL="https://dl.bintray.com/spinnaker/debians"
  latest=`curl $REPOSITORY_URL/dists/$DISTRIB_CODENAME/spinnaker/binary-amd64/Packages | grep "^Filename" | grep $package | awk '{print $2}' | awk -F'/' '{print $NF}' | sort -t. -k 1,1n -k 2,2n -k 3,3n | tail -1`
  debfile=`echo $latest | awk -F "/" '{print $NF}'`
  filelocation=`curl $REPOSITORY_URL/dists/$DISTRIB_CODENAME/spinnaker/binary-amd64/Packages | grep "^Filename" | grep $latest | awk '{print $2}'`
  curl -L -o $debfile $REPOSITORY_URL/$filelocation
done

#deb-s3 upload --bucket my-apt-repo -c my-component -p *.deb
