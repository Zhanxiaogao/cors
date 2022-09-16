#!/bin/bash
CRTDIR=$(cd $(dirname $0); pwd) #当前目录
NGINX_DIR="nginx"
NGINX_File="nginx/nginx.exe"
NGINX_VERSION="1.16.0"
NGINX_RENAME="nginx.zip"
downloadPath="http://nginx.org/download/nginx-${NGINX_VERSION}.zip"

if [[ -d "${NGINX_DIR}" ]] && [[ -f "${NGINX_File}" ]]
then
  echo "nginx found, nginx start..."
  # https://blog.csdn.net/yf210yf/article/details/9207335
  cp ./nginx.conf -f ${CRTDIR}/${NGINX_DIR}/conf # 拷贝根目录下的nginx.conf到 /nginx/conf目录下 
  source ./nginx.sh start
else
  echo "nginx not found, downloading nginx..."
  rm -rf "${CRTDIR}/${NGINX_DIR}"
  rm -rf "${CRTDIR}/${NGINX_RENAME}"
  # wget "$downloadPath" -O nginx.zip && unzip nginx.zip -d .
  # 下载nginx
  # 解压到相应目录
  # 文件夹重命名
  # 删除压缩文件
  # 拷贝根目录下的nginx.conf到 /nginx/conf目录下 
  # 启动nginx
  curl -o "${NGINX_RENAME}" "${downloadPath}"
  unzip "${NGINX_RENAME}" -d .
  mv "${CRTDIR}/nginx-${NGINX_VERSION}" "${CRTDIR}/${NGINX_DIR}"
  rm -f "${NGINX_RENAME}"
  cp ./nginx.conf -f ${CRTDIR}/${NGINX_DIR}/conf
  source ./nginx.sh start
fi

# 此脚本需要用git bash运行 0_o