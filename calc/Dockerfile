FROM alpine:3 as dev
ARG calc_ver=2.13.0.0
RUN apk add --no-cache gcc make musl-dev util-linux
ADD http://isthe.com/chongo/src/calc/calc-${calc_ver}.tar.bz2 /
RUN tar xfj calc-${calc_ver}.tar.bz2
RUN cd calc-${calc_ver} && \
    make EXTRA_CFLAGS='-DFPOS_POS_LEN=FILEPOS_LEN' && \
    make install

FROM alpine:3
COPY --from=dev /usr/lib/libcalc* /usr/lib/
COPY --from=dev /usr/lib/libcustcalc* /usr/lib/
COPY --from=dev /usr/bin/cscript /usr/bin/cscript
COPY --from=dev /usr/share/calc /usr/share/calc
COPY --from=dev /usr/bin/calc /usr/bin/calc
ENTRYPOINT ["calc"]
