# dockertor  
run  
```
docker run --name tor --net host -v /etc/tor/torrc:/etc/tor/torrc buzzkillb/tor:alpine
```
add hidden services  
```
sudo nano /etc/tor/torrc
```
```
HiddenServiceDir /var/lib/tor/hidden_service01/
HiddenServiceVersion 2
HiddenServicePort 33369 127.0.0.1:33369﻿
HiddenServicePort 9999 127.0.0.1:9999
```
get onion address from hidden service config
```
docker exec tor cat /var/lib/tor/hidden_service01/hostname
```
restart tor container  
```
restart tor
```
Be careful running this as people say to use iptables to route this and not --net host, if being behind only tor matters.  

buzzkillb/tor:latest - debian based  
buzzkillb/tor:alpine - alpine based
