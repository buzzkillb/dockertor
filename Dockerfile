FROM debian:stretch-slim

LABEL author="buzzkillb"

RUN apt-get update && apt-get install -y \
    curl \
    gpg \
    gnupg2 \
    apt-utils \
    apt-transport-https \
    wget \
        && echo 'deb https://deb.torproject.org/torproject.org stretch main' | tee -a /etc/apt/sources.list.d/torproject.list \
        && echo 'deb-src https://deb.torproject.org/torproject.org stretch main' | tee -a /etc/apt/sources.list.d/torproject.list \
        && curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import \
        && gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add - \
        && apt-get update \
        && apt-get -y --no-install-recommends install tor deb.torproject.org-keyring \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/torproject/tor/master/src/config/torrc.sample.in > /etc/tor/torrc

EXPOSE 9050

CMD /usr/bin/tor
