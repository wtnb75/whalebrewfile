FROM rust:1-alpine as dev
RUN apk add git make ncurses musl-dev libffi-dev libstdc++
RUN git clone --depth=1 https://github.com/wasmerio/wasmer
RUN cd wasmer && make build-wasmer

FROM alpine:3
COPY --from=dev /wasmer/target/release/wasmer /usr/local/bin/
ENTRYPOINT ["wasmer"]
