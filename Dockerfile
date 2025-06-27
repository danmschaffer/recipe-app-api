FROM python:3.9-alpine3.13
<<<<<<< HEAD
LABEL maintainer="danielmschaffer"

ENV PYTHONUNBUFFERED=1
=======
LABEL maintainer=

ENV PYTHONUNBUFFERED 1
>>>>>>> d9fa6a34d921ae6c04d98e6082e109a1591353ff

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
<<<<<<< HEAD
    if [$DEV = "true"]; \
=======
    if [ $DEV = "true" ]; \
>>>>>>> d9fa6a34d921ae6c04d98e6082e109a1591353ff
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
<<<<<<< HEAD
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH="/py/bin:$PATH"

USER django-user
=======
        --disabled-password \
>>>>>>> d9fa6a34d921ae6c04d98e6082e109a1591353ff
