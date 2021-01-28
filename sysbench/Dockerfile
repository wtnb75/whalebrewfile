FROM alpine:3 as dev
RUN apk add gcc git automake autoconf musl-dev libtool pkgconfig make file
RUN git clone --depth=1 https://github.com/akopytov/sysbench
RUN cd sysbench && sh autogen.sh && ./configure --without-mysql && make && make install

FROM alpine:3
RUN apk add --no-cache libgcc
COPY --from=dev /usr/local/bin/sysbench /usr/local/bin/
COPY --from=dev /usr/local/share/sysbench /usr/local/share/
ENTRYPOINT ["sysbench"]
