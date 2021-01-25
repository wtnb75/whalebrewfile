FROM alpine:3 as dev
ARG duckdb_ver=0.2.3
ADD https://github.com/cwida/duckdb/releases/download/v${duckdb_ver}/duckdb_cli-linux-amd64.zip /
RUN unzip duckdb_cli-linux-amd64.zip

FROM alpine:3
COPY --from=dev /duckdb /usr/local/bin/
ENTRYPOINT ["duckdb"]
