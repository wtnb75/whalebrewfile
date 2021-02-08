#! /bin/sh
set -f

cmd=$1; shift
case "${cmd}" in
  animate|compare|composite|conjure|convert|display|identify|import|magick|magick-script|mogrify|montage|stream)
    exec ${cmd} $*
    ;;
  *)
    echo "Usage: $0 [animate|compare|composite|conjure|convert|display|identify|import|magick|magick-script|mogrify|montage|stream] ..."
    exit 1
    ;;
esac
