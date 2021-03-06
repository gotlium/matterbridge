FROM alpine:edge
ENTRYPOINT ["/bin/matterbridge"]

COPY . /go/src/github.com/42wim/matterbridge
RUN apk update && apk add go git \
        && cd /go/src/github.com/42wim/matterbridge \
        && export GOPATH=/go \
        && go get \
        && go build -o /bin/matterbridge \
        && rm -rf /go \
        && apk del --purge git go
