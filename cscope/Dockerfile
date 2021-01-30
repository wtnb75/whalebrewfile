FROM alpine:3 as dev
ARG cscope_ver=15.9
RUN apk add gcc make musl-dev ncurses-dev
ADD https://downloads.sourceforge.net/project/cscope/cscope/v${cscope_ver}/cscope-${cscope_ver}.tar.gz /
RUN tar xfz cscope-${cscope_ver}.tar.gz
RUN cd cscope-${cscope_ver} && ./configure && make && make install

FROM alpine:3
RUN apk add --no-cache ncurses less vim
RUN mkdir /usr/local/lib/cs
ENV VIEWER=less
ENV EDITOR=vim
COPY --from=dev /usr/local/bin/ /usr/local/bin/
ENTRYPOINT ["ocs"]
