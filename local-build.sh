#! /bin/sh
# Usage: $0 */Dockerfile
prefix=ghcr.io/wtnb75

for i; do
  dn=${i}
  [ -f ${dn} ] && dn=$(dirname $i)
  docker build -t ${prefix}/${dn}:latest ${dn}
  whalebrew install ${prefix}/${dn}
done
