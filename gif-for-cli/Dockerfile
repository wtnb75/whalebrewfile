FROM python:3-alpine as dev
RUN apk add ffmpeg jpeg-dev zlib-dev gcc musl-dev
RUN pip install wheel
RUN pip wheel gif-for-cli

FROM python:3-alpine
COPY --from=dev /*.whl /tmp/
RUN apk add --no-cache ncurses ffmpeg jpeg zlib
RUN pip install /tmp/*.whl
LABEL io.whalebrew.config.volumes '["~/.cache/gif-for-cli:/.cache/gif-for-cli"]'
ENTRYPOINT ["gif-for-cli"]
