FROM python:2-alpine

RUN apk add --no-cache git

COPY ./pip-requirements.txt /pip-requirements.txt
RUN pip install -r pip-requirements.txt && pip install git+https://github.com/linkchecker/linkchecker.git@v9.4.0

ADD ./entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

