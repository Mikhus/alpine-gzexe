# Build Stage
FROM alpine:latest AS build

RUN apk update && apk add --no-cache --update \
    alpine-sdk libffi-dev openssl-dev build-base wget && \
    wget https://ftp.gnu.org/gnu/gzip/gzip-1.6.tar.gz && \
    tar zxvf gzip-1.6.tar.gz && \
    cd gzip-1.6 && ./configure && make && \
    cp gzexe gzip /bin

# Release Stage
FROM scratch AS release

COPY --from=build /bin/gzip /bin/
COPY --from=build /bin/gzexe /bin/
