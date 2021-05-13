# Usage memo

## Directories

- packages: ~/packages/
- distfiles: ~/.cache/distfiles/
- compile cache: ~/.cache/ccache-alpine/
- sign keys: ~/.abuild/

## Subcommands

- keygen
    - alpine-pkg abuild-keygen
- create APKBUILD
    - alpine-pkg newapkbuild xxx
- fetch
    - alpine-pkg abuild fetch
- checksum
    - alpine-pkg abuild checksum
- build
    - alpine-pkg abuild -r
- sign
    - alpine-pkg abuild-sign /home/packager/packages/x86_64/APKINDEX.tar.gz

# Install packages

(TBD)

- docker run -v $HOME/packages:/packages -v $HOME/.abuild:/keys -ti alpine:3 sh
    - echo "/packages" | tee -a /etc/apk/repositories
    - cp /keys/*.rsa.pub /etc/apk/keys/
    - apk update
    - apk add calc
