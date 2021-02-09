#! /bin/sh
set -f

cmd=$1; shift

[ -n "${cmd}" ] && exec ${cmd} $*
echo -e "Usage: csvkit SUBCOMMAND ...\n"
echo "Package info:"
pip show csvkit 2>/dev/null
echo ""
echo "SUBCOMMANDS:"
pip show -f csvkit 2>/dev/null | grep bin/  | awk -F/ '{cmd=$NF; print "  "cmd;}'

