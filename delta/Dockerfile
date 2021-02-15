FROM rust:1-alpine as dev
RUN apk add musl-dev
RUN cargo install git-delta

FROM alpine:3
RUN apk add --no-cache less
COPY --from=dev /usr/local/cargo/bin/delta /usr/local/bin/
ENTRYPOINT ["delta"]
