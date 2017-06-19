FROM ubuntu:16.04

MAINTAINER Fabrizio Torelli (fabrizio.torelli@wipro.com)

ENV PATH=/usr/local/bin:$PATH \
    REPO_ADDRESS=127.0.0.1 \
    REPO_PORT=9999 \
    DISTRIBUTION="trusty" \
    COMPONENTS="main" \
    DEB_REPO_NAME="hello-repository" \
    MIRROR_REPO_NAME="spinnaker-distrib" \
    DEBIAN_FRONTEND=noninteractive

USER root

# RUN mkdir /aptly && apt-get update && apt-get install -y debconf* wget curl sudo bzip2 gnupg gpgv libc6 xz-utils graphviz
#
# RUN echo "debian location: $(which deb)"
#
# RUN mkdir /aptly && apt-get update && apt-get install -y wget curl sudo bzip2 gnupg gpgv libc6 xz-utils
#
# RUN  echo "deb http://repo.aptly.info/ squeeze main" > /etc/apt/sources.list.d/aptly.list && apt-key adv --keyserver keys.gnupg.net --recv-keys 9E3E53F19C7DE460 && \
#      wget -qO - https://www.aptly.info/pubkey.txt | apt-key add - && apt-get update && apt-get install  --force-yes -y aptly

# RUN echo "deb http://repo.aptly.info/ squeeze main" > /etc/apt/sources.list.d/aptly.list && \
# apt-key adv --keyserver keys.gnupg.net --recv-keys 2A194991 && \
# apt-get update && \
# apt-get install aptly  --force-yes -y

RUN mkdir /aptly && apt-get update && apt-get install -y wget curl sudo bzip2 gnupg gpgv libc6 xz-utils aptly

ADD aptly.conf /etc/aptly.conf

ADD start-client.sh /usr/local/bin/start-client
ADD insert-update-repo-debian.sh /usr/local/bin/insert-update-debian-package
ADD download-spinnaker-deb.sh /root/download-spinnaker-deb.sh

RUN chmod 777 /usr/local/bin/start-client && chmod 777 /usr/local/bin/insert-update-debian-package && chmod 777 /root/download-spinnaker-deb.sh

VOLUME ["/aptly",]

ENTRYPOINT ["start-client"]
