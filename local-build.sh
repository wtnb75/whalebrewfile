#! /bin/sh
# Usage: $0 */Dockerfile
prefix=ghcr.io/wtnb75

for i; do
  docker build -t ${prefix}/$(dirname $i):latest $(dirname $i)
  whalebrew install ${prefix}/$(dirname $i)
done
