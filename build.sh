#!/bin/sh

export PATH=/sbin:/usr/sbin:$PATH

debos --scratchsize=8G rootfs.yaml &&
debos --scratchsize=8G image.yaml
