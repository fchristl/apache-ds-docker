# Apache Directory Server Docker Image
This docker image contains an Apache Directory Server instance. 

## Exposed Ports

- 10389: default LDAP port
- 10636: LDAPs port

## Build

docker build -t apache-ds .

## Run

docker run -p 389:10389 -p 636:10636 apache-ds

## Enable SSL

A keystore to enable SSL is included out of the box. To enable it, follow the steps
under https://directory.apache.org/apacheds/basic-ug/3.3-enabling-ssl.html. 

The keystore location is `/etc/ads.ks`, the password is `secret`.
