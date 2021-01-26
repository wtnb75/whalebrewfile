FROM alpine:3 as dev
ARG pandoc_ver=2.11.4
ADD https://github.com/jgm/pandoc/releases/download/${pandoc_ver}/pandoc-${pandoc_ver}-linux-amd64.tar.gz /
RUN tar xfz pandoc-${pandoc_ver}-linux-amd64.tar.gz
RUN cp pandoc-${pandoc_ver}/bin/pandoc /

FROM alpine:3
COPY --from=dev /pandoc /usr/local/bin/
ENTRYPOINT ["pandoc"]
