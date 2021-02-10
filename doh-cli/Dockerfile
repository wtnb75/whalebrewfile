FROM python:3-alpine
RUN pip install doh-cli
ADD doh-cli.patch /tmp/
RUN apk add --no-cache patch && cd /usr/local/bin/ && patch -p0 < /tmp/doh-cli.patch && apk del --no-cache patch
ENTRYPOINT ["doh-cli"]
