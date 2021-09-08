FROM python:3.9.7-slim-buster

RUN apt-get update && apt-get upgrade -y

RUN pip3 install gunicorn uvicorn[standard] uvloop httptools

COPY requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt

COPY app/ /app

ENV ACCESS_LOG=${ACCESS_LOG:-/proc/1/fd/1}
ENV ERROR_LOG=${ERROR_LOG:-/proc/1/fd/2}

ENTRYPOINT /usr/local/bin/gunicorn main:app \
    -b 0.0.0.0:3000 \
    -w 4 \
    -k uvicorn.workers.UvicornWorker \
    --chdir /app \
    --access-logfile "$ACCESS_LOG" \
    --error-logfile "$ERROR_LOG"
