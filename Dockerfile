FROM ubuntu:19.10

LABEL maintainer="Yutaka Nishimura <ytk.nishimura@gmail.com>"

COPY ./v /opt/v
WORKDIR /opt/v
RUN set -e \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    gcc \
    clang \
    make \
    git \
    rlwrap \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* \
  && update-ca-certificates \
  && make \
  && ln -s /opt/v/v /usr/local/bin/v

COPY ./entrypoint.sh /entrypoint.sh
WORKDIR /

ENTRYPOINT ["/entrypoint.sh"]
