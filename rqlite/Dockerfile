FROM golang:1-alpine as dev
RUN apk add git gcc musl-dev
RUN go get github.com/rqlite/rqlite/cmd/rqlited
RUN go get github.com/rqlite/rqlite/cmd/rqlite
RUN go get github.com/rqlite/rqlite/cmd/rqbench

FROM alpine:3
COPY --from=dev /go/bin/rq* /usr/local/bin/
ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
