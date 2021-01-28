#! /bin/sh
# Usage: $0 */Dockerfile
prefix=ghcr.io/wtnb75

for i; do
  dn=${i}
  [ -f ${dn} ] && dn=$(dirname $i)
  docker pull ${prefix}/${dn}:latest
  whalebrew uninstall -y ${dn}
  if type ${dn} > /dev/null 2>/dev/null; then
    echo "pass ${dn}"
  else
    whalebrew install -y ${prefix}/${dn}
  fi
done
