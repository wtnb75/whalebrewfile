#! /bin/sh
set -f

cmd=$1; shift
case "${cmd}" in
  rqbench|rqlite|rqlited)
    exec ${cmd} $*
    ;;
  *)
    echo "Usage: $0 [rqbench|rqlite|rqlited] ..."
    exit 1
    ;;
esac
