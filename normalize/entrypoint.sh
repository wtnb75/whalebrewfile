#! /bin/sh
set -f

cmd=$1; shift

[ -n "${cmd}" -a  -x /usr/local/bin/${cmd} ] && exec /usr/local/bin/${cmd} $*
echo -e "Usage: normalize SUBCOMMAND ...\n"
echo "SUBCOMMANDS:"
find /usr/local/bin -maxdepth 1 -type f -executable | awk -F/ '{cmd=$NF; print "  "cmd;}'

