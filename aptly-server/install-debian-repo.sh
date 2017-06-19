#!/bin/bash
yum install -y git wget
cd /root
wget https://dl.bintray.com/smira/aptly/0.9.5/debian-squeeze-x64/aptly
chmod +x aptly
cp aptly /bin/
cp aptly.1 /bin/
yum install nano -y
yum install epel-release -y
yum install nginx -y
chmod -R g+rx /root
usermod -a -G root nginx
setenforce permissive
yum install bzip2 -y
if ! [[ -z "$(aptly repo list | grep "[$REPO_NAME]")" ]]; then
  echo "Dropping existing Debian repository ..."
  aptly repo drop "$REPO_NAME"
fi
echo "Creating Debian repository ..."
aptly repo create "$REPO_NAME"
echo "Publiching main component in Debian Repository ..."
aptly publish repo -architectures="amd64" -component=main -distribution=trusty -skip-signing=true "$REPO_NAME"
echo "Configuring Ngnix ..."
cp  /etc/nginx/nginx.conf /etc/nginx/nginx.old.conf
sed -i s/user\ nginx/user\ root/g /etc/nginx/nginx.conf
cat  /etc/nginx/nginx.conf | head -n $(($(wc -l < /etc/nginx/nginx.conf) - 2)) > /etc/nginx/nginx.conf
cat /root/nginx.conf.diff >> /etc/nginx/nginx.conf
echo "Removing installation files ..."
rm -f /root/nginx.conf.diff
rm -f /root/install-debian-repo.sh
