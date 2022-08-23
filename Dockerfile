FROM alpine:3.16.0

RUN apk --no-cache add python3=3.10.5-r0 \
                       py3-pip

RUN pip install --no-cache-dir pymongo \
                               dnspython

RUN mkdir /workdir

COPY entrypoint.sh /entrypoint.sh
COPY upload_metrics.py /upload_metrics.py

ENTRYPOINT ["/entrypoint.sh"]
