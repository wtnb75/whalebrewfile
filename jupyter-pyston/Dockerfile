FROM ubuntu:20.04 as dev
ADD https://github.com/pyston/pyston/releases/download/v2.1/pyston_2.1_20.04.deb /
RUN apt update
RUN apt install -y libczmq-dev libffi-dev gcc ./pyston_2.1_20.04.deb
RUN pip-pyston install wheel
RUN pip-pyston wheel jupyter

FROM ubuntu:20.04
COPY --from=dev /*.deb /tmp
COPY --from=dev /*.whl /tmp
RUN apt update && apt install -y libczmq libffi /tmp/pyston_2.1_20.04.deb && apt clean
RUN pip-pyston install /tmp/*.whl
LABEL io.whalebrew.config.networks '["host"]'
ENTRYPOINT ["jupyter", "notebook", "--allow-root"]
