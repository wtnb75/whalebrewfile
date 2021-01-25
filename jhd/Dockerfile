FROM alpine:3 as dev
RUN apk add gcc musl-dev make
ADD http://distcache.freebsd.org/ports-distfiles/jhd-2.3.tar.gz /
RUN tar xfz jhd-2.3.tar.gz
RUN cd jhd-2.3 && make && make install DEST=/usr/bin

FROM alpine:3
COPY --from=dev /usr/bin/jhd /usr/bin/jhd
ENTRYPOINT ["jhd"]
