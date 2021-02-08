FROM alpine:3
RUN apk add --no-cache john
LABEL io.whalebrew.config.volumes '["~/.john:/root/.john:rw"]'
LABEL io.whalebrew.config.keep_container_user 'true'
ENTRYPOINT ["john"]
