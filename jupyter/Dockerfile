FROM python:3 as dev
RUN pip install wheel
RUN pip wheel jupyter

FROM python:3
COPY --from=dev /*.whl /tmp/
RUN pip install /tmp/*.whl
LABEL io.whalebrew.config.volumes '["~/.local/share:/root/.local/share:rw"]'
LABEL io.whalebrew.config.ports '["8888:8888"]'
LABEL io.whalebrew.config.keep_container_user 'true'
ENTRYPOINT ["jupyter", "notebook", "--allow-root", "--ip", "0.0.0.0"]
