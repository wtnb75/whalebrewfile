FROM alpine:3 as dev
RUN apk add gcc make cmake musl-dev bison python3-dev
ARG monetdb_ver=11.39.11
ADD alpine-build.patch /
ADD https://www.monetdb.org/downloads/sources/Latest/MonetDB-${monetdb_ver}.tar.bz2 /
RUN tar xfj MonetDB-${monetdb_ver}.tar.bz2
RUN cd MonetDB-${monetdb_ver} && patch -p1 < /alpine-build.patch && \
    mkdir build && cd build && cmake .. && make && make install

FROM alpine:3
COPY --from=dev /usr/local/ /usr/local/
ENTRYPOINT ["monetdb"]
