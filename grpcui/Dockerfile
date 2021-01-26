FROM golang:1-alpine as dev
RUN apk add git
RUN go get github.com/fullstorydev/grpcui/...
RUN go install github.com/fullstorydev/grpcui/cmd/grpcui

FROM alpine:3
COPY --from=dev /go/bin/grpcui /usr/local/bin/
LABEL io.whalebrew.config.networks '["host"]'
ENTRYPOINT ["grpcui"]
