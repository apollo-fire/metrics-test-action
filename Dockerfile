FROM alpine:3.17.2

RUN apk --no-cache add python3=3.10.6-r0
RUN pip install pymongo \
                dnspython

RUN mkdir /workdir

COPY entrypoint.sh /entrypoint.sh
COPY upload_metrics.py /upload_metrics.py

ENTRYPOINT ["/entrypoint.sh"]
