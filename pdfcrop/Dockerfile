FROM alpine:3 as dev
ARG pdfcrop_ver=1.40
ADD https://github.com/ho-tex/pdfcrop/archive/v${pdfcrop_ver}.tar.gz /
RUN tar xfz v${pdfcrop_ver}.tar.gz
RUN cp pdfcrop-${pdfcrop_ver}/pdfcrop.pl /usr/local/bin/

FROM alpine:3
RUN apk add --no-cache perl bash
COPY --from=dev /usr/local/bin/pdfcrop.pl /usr/local/bin/
ENTRYPOINT ["pdfcrop.pl"]
