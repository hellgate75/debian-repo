FROM centos:7

MAINTAINER Fabrizio Torelli (fabrizio.torelli@wipro.com)
ENV REPO_NAME="hello-repository" \
    PATH=/usr/local/bin:$PATH

USER root

ADD install-debian-repo.sh /root/install-debian-repo.sh
ADD nginx.conf.diff /root/nginx.conf.diff
ADD start-aptly.sh /usr/local/bin/start-aptly
RUN chmod 777 /root/install-debian-repo.sh && chmod 777 /root/nginx.conf.diff && chmod 777 /usr/local/bin/start-aptly && mkdir /aptly

ADD aptly.conf /etc/aptly.conf

VOLUME ["/aptly", "/etc/ngnix"]

ENTRYPOINT ["start-aptly"]
