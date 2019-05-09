# Build Mono Container
FROM geoffh1977/alpine:latest
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"
USER root

# Install Mono
# hadolint ignore=DL3013,DL3018
RUN apk -U --no-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing add mono && \
    apk add --no-cache --virtual=.build-dependencies ca-certificates && \
    cert-sync /etc/ssl/certs/ca-certificates.crt && \
    apk del .build-dependencies
    
USER ${ALPINE_USER}
