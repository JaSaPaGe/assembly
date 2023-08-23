FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y bamtools ncbi-blast+

WORKDIR /opt

RUN curl -L -O https://github.com/sheinasim/HiFiAdapterFilt/archive/refs/tags/v2.0.0.tar.gz

RUN tar xvzf v2.0.0.tar.gz

RUN chmod +x HiFiAdapterFilt-2.0.0/*.sh

ENV PATH="$PATH:/opt/HiFiAdapterFilt-2.0.0:/opt/HiFiAdapterFilt-2.0.0/DB"

RUN echo $PATH