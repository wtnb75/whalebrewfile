FROM ubuntu:20.04
ARG wavm_ver=2021-03-22
ADD https://github.com/WAVM/WAVM/releases/download/nightly%2F${wavm_ver}/wavm-0.0.0-prerelease-linux.deb /
RUN apt install -y ./wavm-0.0.0-prerelease-linux.deb && apt clean all
LABEL io.whalebrew.config.volumes '["~/.cache/wavm:/.cache:rw"]'
ENV WAVM_OBJECT_CACHE_DIR=/.cache
ENTRYPOINT ["wavm"]
