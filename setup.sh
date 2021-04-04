#!/bin/bash

ETCD_VERSION=v3.4.15
ETCD_DIR=etcd-$ETCD_VERSION-linux-amd64


mkdir -p .downloads

curl -L https://github.com/etcd-io/etcd/releases/download/$ETCD_VERSION/$ETCD_DIR.tar.gz -o .downloads/$ETCD_DIR.tar.gz
tar xzf .downloads/$ETCD_DIR.tar.gz --strip-components 1 $ETCD_DIR/{etcd,etcdctl}
