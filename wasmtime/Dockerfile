FROM rust:1-alpine as dev
RUN apk add git musl-dev
RUN git clone --depth=1 --recurse-submodules https://github.com/bytecodealliance/wasmtime.git
RUN cd wasmtime && cargo build --release

FROM alpine:3
COPY --from=dev /wasmtime/target/release/wasmtime /usr/local/bin/
LABEL io.whalebrew.config.keep_container_user 'true'
LABEL io.whalebrew.config.volumes '["~/.cache:/root/.cache:rw"]'
ENTRYPOINT ["wasmtime"]
