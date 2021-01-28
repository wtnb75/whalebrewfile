FROM golang:1-alpine as dev
RUN apk add git
RUN GO111MODULE=on go get github.com/mithrandie/csvq

FROM alpine:3
COPY --from=dev /go/bin/csvq /usr/local/bin/
ENTRYPOINT ["csvq"]
