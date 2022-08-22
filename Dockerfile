FROM ubuntu:22.04

COPY docker-setup.sh .
RUN sh docker-setup.sh
WORKDIR /root/cis3800
