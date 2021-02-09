FROM alpine:3 as dev
RUN apk add git gcc make musl-dev
RUN git clone --depth=1 https://github.com/sshlien/abcmidi
RUN cd abcmidi && make && make install

FROM alpine:3
COPY --from=dev /usr/local/bin/* /usr/local/bin/
ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
