FROM python:3-alpine
RUN apk add --no-cache git
RUN git clone --depth=1 https://github.com/alberthier/git-webui.git
LABEL io.whalebrew.config.ports '["8000:8000"]'
ENTRYPOINT ["/git-webui/release/libexec/git-core/git-webui"]
