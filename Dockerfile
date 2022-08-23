FROM alpine:3.16.2

RUN apk --no-cache add python3=3.10.5-r0 \
                       py3-pip=22.1.1-r0 \
                       bash=5.1.16-r2

RUN pip install --no-cache-dir pymongo==4.2.0 \
                               dnspython==2.2.1

COPY entrypoint.sh /entrypoint.sh
COPY upload_metrics.py /upload_metrics.py

ENTRYPOINT ["/entrypoint.sh"]
