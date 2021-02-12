#!/usr/bin/env sh

# To monitor output of a script
# consul monitor --log-level=DEBUG

echo "Watcher triggered for : $1"

datadir='/consul/data'
keysdir="${datadir}/keys"
keydir="${keysdir}/$(dirname $1)"
keyfile="${keysdir}/$1.txt"

mkdir -p ${keydir}
consul kv get $1 1> ${keyfile}
