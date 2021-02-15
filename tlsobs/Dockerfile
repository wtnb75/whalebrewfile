FROM golang:1-alpine as dev
RUN apk add git make gcc musl-dev
RUN git clone --depth=1 https://github.com/mozilla/tls-observatory
RUN cd tls-observatory && make

FROM alpine:3
COPY --from=dev /go/bin/tlsobs /usr/local/bin
ENTRYPOINT ["tlsobs"]
