FROM alpine:3 as dev
ARG pdfcrop_ver=0.4b
ADD https://jaist.dl.sourceforge.net/project/pdfcrop/pdfcrop/PDFCrop%20v${pdfcrop_ver}/pdfcrop_v${pdfcrop_ver}.tar.gz /
RUN tar xfz pdfcrop_v${pdfcrop_ver}.tar.gz
RUN cp pdfcrop_v${pdfcrop_ver}/pdfcrop /usr/local/bin/

FROM alpine:3
RUN apk add --no-cache perl
COPY --from=dev /usr/local/bin/pdfcrop /usr/local/bin/
ENTRYPOINT ["pdfcrop"]
