#! /bin/sh
set -f

cmd=$1; shift
case "${cmd}" in
  abuild|abuild-addgroup|abuild-adduser|abuild-apk|abuild-fetch|abuild-gzsplit|abuild-keygen|abuild-rmtemp|abuild-sign|abuild-sudo|abuild-tar|abump|apkgrel|buildlab|checkapk|newapkbuild|apkbuild-fixer|apkbuild-lint|aports-lint|initd-lint|secfixes-check)
    exec ${cmd} $*
    ;;
  *)
    echo "Usage: $0 [abuild|abuild-addgroup|abuild-adduser|abuild-apk|abuild-fetch|abuild-gzsplit|abuild-keygen|abuild-rmtemp|abuild-sign|abuild-sudo|abuild-tar|abump|apkgrel|buildlab|checkapk|newapkbuild|apkbuild-fixer|apkbuild-lint|aports-lint|initd-lint|secfixes-check] ..."
    exit 1
    ;;
esac
