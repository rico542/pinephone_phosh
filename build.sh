#!/bin/sh

export PATH=/sbin:/usr/sbin:$PATH

if [ "$http_proxy" ]
then
  ARGS="-e http_proxy:\"$http_proxy\""
fi

if [ "$ftp_proxy" ]
then
  ARGS="$ARGS -e ftp_proxy:\"$ftp_proxy\""
fi

ARGS="$ARGS --scratchsize=8G"

debos $ARGS rootfs.yaml &&
debos $ARGS image.yaml
