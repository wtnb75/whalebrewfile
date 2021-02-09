#! /bin/sh
set -f

cmd=$1; shift

[ -n "${cmd}" ] && exec ${cmd} $*
echo -e "Usage: imagemagick SUBCOMMAND ...\n"
echo "Package info:"
apk info imagemagick 2>/dev/null
echo ""
echo "SUBCOMMANDS:"
apk info -L imagemagick 2>/dev/null | grep bin/  | awk -F/ '{cmd=$NF; print "  "cmd;}'

