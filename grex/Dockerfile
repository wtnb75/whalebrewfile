FROM rust:1-alpine as dev
RUN apk add musl-dev
RUN cargo install grex

FROM alpine:3
COPY --from=dev /usr/local/cargo/bin/grex /usr/local/bin/
ENTRYPOINT ["grex"]
