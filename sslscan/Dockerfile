FROM alpine:3 as dev
RUN apk add gcc make git zlib-dev linux-headers perl musl-dev
RUN git clone --depth=1 https://github.com/rbsec/sslscan
RUN cd sslscan && make static

FROM alpine:3
COPY --from=dev /sslscan/sslscan /usr/local/bin/
RUN apk add --no-cache zlib
ENTRYPOINT ["sslscan"]
