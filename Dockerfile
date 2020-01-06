FROM alpine:latest

MAINTAINER henk.wobbes (at) gmail.com

ENV KUBECTL_VERSION=v1.10.4
ENV HELM_VERSION=v2.9.1

RUN apk add --no-cache ca-certificates bash curl gettext \
 && apk add --no-cache --virtual deps tar gzip \
 && curl --location https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl --output /usr/local/bin/kubectl \
 && curl --location --silent --show-error https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar --extract --gunzip --strip-components=1 --directory=/usr/local/bin linux-amd64/helm \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps

CMD ["bin/bash"]
