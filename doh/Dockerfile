FROM golang:1-alpine as dev
RUN apk add git
RUN go get github.com/picatz/doh
RUN go install github.com/picatz/doh@latest

FROM alpine:3
RUN apk add --no-cache ca-certificates-bundle
COPY --from=dev /go/bin/doh /usr/local/bin/
ENTRYPOINT ["doh"]
