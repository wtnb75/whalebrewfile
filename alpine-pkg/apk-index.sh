#! /bin/sh
. $HOME/.abuild/abuild.conf
pkgdir=$HOME/packages

for d in ${pkgdir}/*; do
  [ -d "${d}" ] || continue
  apk index -o ${d}/APKINDEX.tar.gz ${d}/*.apk
  [ -f "${PACKAGER_PRIVKEY}" ] || continue
  abuild-sign -k ${PACKAGER_PRIVKEY} ${d}/APKINDEX.tar.gz
done
