FROM alpine:3 as dev
RUN apk add gcc curl musl-dev
ADD https://gist.githubusercontent.com/wtnb75/8836dac904f53dcff7dc/raw/d54b3303cd658761b150fce763f45155345397cc/randgen.c /
ADD http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/SFMT/SFMT-src-1.4.1.tar.gz /
RUN tar xfz SFMT-src-1.4.1.tar.gz
RUN tail -n2 randgen.c | cut -f2- -d' ' | sh -x

FROM alpine:3
COPY --from=dev /randgen-x86_64 /
COPY --from=dev /randgen-x86_64-sse2 /
ENTRYPOINT ["/randgen-x86_64-sse2"]
