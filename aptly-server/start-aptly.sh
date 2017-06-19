#!/bin/bash
if [[ -e /root/install-debian-repo.sh ]]; then
  /root/install-debian-repo.sh
fi
if [[ -e /usr/local/nginx/logs/nginx.pid ]]; then
  echo "Stopping Nginix"
  export NGNIX_PID="$( cat /usr/local/nginx/logs/nginx.pid )"
  if ! [[ -z "$( ps -eaf|grep "'$NGNIX_PID ''" )" ]]; then
    kill -QUIT $( cat /usr/local/nginx/logs/nginx.pid )
  fi
  rm /usr/local/nginx/logs/nginx.pid
fi
echo "Starting Ngnix"
nginx
echo "Waiting forever ..."
tail -f /dev/null
