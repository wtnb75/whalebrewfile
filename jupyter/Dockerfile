FROM python:3 as dev
RUN pip install wheel
RUN pip wheel jupyter

FROM python:3
COPY --from=dev /*.whl /tmp/
RUN pip install /tmp/*.whl
ENTRYPOINT ["jupyter", "notebook", "--allow-root", "--ip", "0.0.0.0"]
