FROM alpine:3.13

WORKDIR /app
RUN apk add --no-cache --update \
        python3-dev \
        alpine-sdk \
        py-pip \
        bash

RUN python3 -m venv .venv && .venv/bin/pip install --no-cache-dir -U pip setuptools
COPY requirements.txt .
RUN .venv/bin/pip install --no-cache-dir -r requirements.txt

# Cleanup
RUN rm -f requirements.txt

ENTRYPOINT /bin/bash
