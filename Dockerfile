FROM python:3-alpine

RUN apk add --no-cache git

COPY ./pip-requirements.txt /pip-requirements.txt
RUN pip install -r pip-requirements.txt

ADD ./entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

