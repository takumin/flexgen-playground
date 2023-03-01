FROM ubuntu:22.04

RUN apt-get update \
 && apt-get install --no-install-recommends -y git python3 python3-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/Ying1123/FlexGen.git /usr/src/FlexGen
WORKDIR /usr/src/FlexGen
# Require PyTorch?
RUN pip3 install flexgen
