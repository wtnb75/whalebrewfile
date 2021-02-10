FROM alpine:3 as dev
RUN apk add git make gcc g++ musl-dev autoconf automake libtool gawk gettext-dev diffutils texinfo gd-dev libharu-dev rapidjson-dev lmdb-dev gmp-dev mpfr-dev postgresql-dev hiredis-dev expat-dev
#ADD http://laurikari.net/tre/tre-0.8.0.tar.bz2 /
# (laurikari.net has expired certificate)
RUN apk add curl && curl -LO -k http://laurikari.net/tre/tre-0.8.0.tar.bz2
RUN tar xfj tre-0.8.0.tar.bz2
RUN cd tre-0.8.0 && ./configure && make && make install
RUN git clone --depth=1 https://git.code.sf.net/p/gawkextlib/code gawkextlib-code
RUN cd gawkextlib-code && sh build_all.sh || true
# aregex, nl_langinfo would be failed
RUN cd gawkextlib-code && cd aregex && make install
RUN cd gawkextlib-code && cd nl_langinfo && make install

FROM alpine:3
RUN apk add --no-cache gawk gd libharu rapidjson lmdb gmp mpfr postgresql-libs hiredis gettext-libs expat libstdc++
COPY --from=dev /usr/local/lib/gawk/*.so /usr/lib/gawk/
COPY --from=dev /usr/local/lib/lib*.so* /usr/local/lib/
COPY --from=dev /usr/local/share/awk/*.awk /usr/share/awk/
ENTRYPOINT ["gawk"]
