FROM python:3-alpine as dev
RUN apk add gcc icu-dev musl-dev g++
RUN pip wheel csvkit

FROM python:3-alpine
RUN apk add --no-cache icu-libs
COPY --from=dev /*.whl /tmp/
RUN pip install /tmp/*.whl && rm -rf /root/.cache
ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
