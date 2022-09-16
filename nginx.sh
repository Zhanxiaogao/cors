#!/bin/bash
CRTDIR=$(cd $(dirname $0); pwd) #当前目录
NGINX_DIR="nginx"
cd "${CRTDIR}/${NGINX_DIR}" #切到当前nginx根目录

NGINX="./nginx.exe"
NGINX_CONF="./conf/nginx.conf"
Start="start ${NGINX}"
Stop="${NGINX} -s stop"
Reload="${NGINX} -s reload"

case "$1" in 
  "start")
    echo "nginx start"
    cp ${CRTDIR}/nginx.conf -f ${CRTDIR}/${NGINX_DIR}/conf # 拷贝根目录下的nginx.conf到 /nginx/conf目录下 
    ${Start} -c ${NGINX_CONF}
    ;;
  "stop")
    echo "nginx stop"
    ${Stop}
    ;;
  "reload")
    echo "nginx reload"
    cp ${CRTDIR}/nginx.conf -f ${CRTDIR}/${NGINX_DIR}/conf # 拷贝根目录下的nginx.conf到 /nginx/conf目录下 
    ${Reload}
    ;;
  *)
    echo commond not exist!
    exit 1
esac
