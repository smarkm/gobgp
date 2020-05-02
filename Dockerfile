
#This docker image just used for local test
FROM ubuntu:16.04

EXPOSE 179
RUN apt update
RUN apt install net-tools -y
ADD gobgp /sbin/
ADD gobgpd /sbin/

CMD gobgpd -f /etc/gobgp/gobgp.yaml