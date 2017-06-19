#!/bin/bash
sleep 60
echo "$(ifconfig eth0 | grep 'inet '|awk 'BEGIN {FS=OFS=" "}{print $2}')   $(hostname)" >> /etc/hosts
mkdir /home/centos/shared-agent
chown -R centos:centos /home/centos/shared-agent/
yum install -y wget
cd /opt
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz"
tar xzf jdk-8u121-linux-x64.tar.gz
cd /opt/jdk1.8.0_121/
alternatives --install /usr/bin/java java /opt/jdk1.8.0_121/bin/java 2
alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_121/bin/jar 2
alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_121/bin/javac 2
alternatives --set jar /opt/jdk1.8.0_121/bin/jar
alternatives --set javac /opt/jdk1.8.0_121/bin/javac
export JAVA_HOME=/opt/jdk1.8.0_121
echo 'JAVA_HOME=/opt/jdk1.8.0_121' >> /home/centos/.bash_profile
export JRE_HOME=/opt/jdk1.8.0_121/jre
echo 'JRE_HOME=/opt/jdk1.8.0_121/jre' >> /home/centos/.bash_profile
export PATH=$PATH:/opt/jdk1.8.0_121/bin:/opt/jdk1.8.0_121/jre/bin
echo 'PATH=$PATH:/opt/jdk1.8.0_121/bin:/opt/jdk1.8.0_121/jre/bin' >> /home/centos/.bash_profile
yum install -y git wget
cd /root
wget https://dl.bintray.com/smira/aptly/0.9.5/debian-squeeze-x64/aptly
chmod +x aptly
cp aptly /bin/ && cp aptly.1 /bin/ && yum install -y nano epel-release nginx bzip2 && chmod -R g+rx /root && usermod -a -G root nginx && setenforce permissive
aptly mirror create -ignore-signatures=true spinnaker-distrib http://10.0.1.52:9999 trusty main
aptly mirror update -ignore-signatures=true spinnaker-distrib'
echo '\#!/bin/bash\
' >> /usr/local/bin/insert-update-debian-package
echo 'DEBIAN_REPO=\'hello-repository\'\
' >> /usr/local/bin/insert-update-debian-package
echo 'MIRROR_REPO=\'spinnaker-distrib\'\
' >> /usr/local/bin/insert-update-debian-package
echo 'if ! [[ -z \"\$1\"  ]]; then\
' >> /usr/local/bin/insert-update-debian-package
echo '  aptly repo add \"\$DEBIAN_REPO\" \"\$1\"\
' >> /usr/local/bin/insert-update-debian-package
echo '  aptly mirror update -ignore-signatures=true \"\$MIRROR_REPO\"\
' >> /usr/local/bin/insert-update-debian-package
echo '  echo -e "Debian package \$1 correctly deployed on \$DEBIAN_REPO and mirrored on \$MIRROR_REPO"\
' >> /usr/local/bin/insert-update-debian-package
echo '  exit 0\
' >> /usr/local/bin/insert-update-debian-package
echo 'else\
' >> /usr/local/bin/insert-update-debian-package
echo '  echo "No suitable debian file to deploy to mirroring repository"\
' >> /usr/local/bin/insert-update-debian-package
echo '  exit 1\
' >> /usr/local/bin/insert-update-debian-package
echo 'fi\
' >> /usr/local/bin/insert-update-debian-package
chmod +x /usr/local/bin/insert-update-debian-package


# sudo cat /var/log/cloud-init.log
# sudo cat /var/log/cloud-init-output.log
# sudo cat /var/lib/cloud/instance/scripts/part-001
# ftorelli-spinnaker-cfn-stack
# ftorelli-us-east-1-key-pair
