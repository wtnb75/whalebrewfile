FROM golang:1-alpine as dev
RUN apk add git
RUN git clone https://github.com/FiloSottile/mkcert
RUN cd mkcert && go build -ldflags "-X main.Version=$(git describe --tags)" && go install

FROM alpine:3
COPY --from=dev /go/bin/mkcert /usr/local/bin/
LABEL io.whalebrew.config.keep_container_user 'true'
ENTRYPOINT ["mkcert"]
