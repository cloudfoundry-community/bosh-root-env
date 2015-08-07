#!/bin/bash

org=${org:-cloudfoundry-community}
repo=${repo:-bosh-root-env}
branch=${branch:-master}

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

download_url=https://github.com/${org}/${repo}/archive/${branch}.tar.gz
download_env=/tmp/bosh-root-env

rm -rf ${download_env}
mkdir -p ${download_env}
curl -L ${download_url} | tar -xz -C $download_env

env_root=${download_env}/${repo}-${branch}

if [[ -d /root ]]; then
  mv /root /root.bak
  ln -s ${env_root} /root
else
  rm /root
  ln -s ${env_root} /root
fi
