FROM rust:1-alpine as dev
RUN apk add musl-dev
RUN cargo install bat

FROM alpine:3
RUN apk add --no-cache less
COPY --from=dev /usr/local/cargo/bin/bat /usr/local/bin/
ENTRYPOINT ["bat"]
