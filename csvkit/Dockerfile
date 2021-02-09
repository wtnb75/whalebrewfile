FROM python:3-alpine
RUN pip install csvkit && rm -rf /root/.cache
ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
