FROM python:3-alpine

COPY ./pip-requirements.txt /pip-requirements.txt
RUN pip install -r pip-requirements.txt

ADD ./entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

