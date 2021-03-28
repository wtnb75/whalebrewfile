FROM alpine:3 as dev
RUN apk add audiofile-dev audiofile-libs libmad-dev gcc make musl-dev
ADD http://savannah.nongnu.org/download/normalize/normalize-0.7.7.tar.bz2 /
RUN tar xfj /normalize-0.7.7.tar.bz2
RUN cd normalize-0.7.7 && \
    ./configure && make && make install

FROM alpine:3
RUN apk add --no-cache audiofile-libs libmad perl lame vorbis-tools flac
COPY --from=dev /usr/local/bin/normalize* /usr/local/bin/
ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
