#! /bin/sh

whalebrew list --no-headers | while read name image ; do
  echo docker pull ${image}
done
