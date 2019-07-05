FROM alpine:edge

MAINTAINER Buzzkillb

RUN apk -U add tor torsocks
ADD https://raw.githubusercontent.com/torproject/tor/master/src/config/torrc.sample.in /etc/tor/torrc

EXPOSE 9050 53/udp

CMD /usr/bin/tor -f /etc/tor/torrc
