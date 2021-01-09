FROM ubuntu:20.04

COPY docker-setup.sh .
RUN chmod +x docker-setup.sh
RUN ./docker-setup.sh

RUN mkdir /vagrant
WORKDIR /vagrant