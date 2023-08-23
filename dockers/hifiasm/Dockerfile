FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y git-core

WORKDIR /opt

RUN git clone https://github.com/chhylp123/hifiasm

RUN apt-get install -y build-essential
RUN apt-get install -y zlib1g-dev

RUN cd hifiasm && make

ENV PATH="$PATH:/opt/hifiasm"

RUN echo $PATH