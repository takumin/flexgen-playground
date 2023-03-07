FROM ubuntu:22.04

RUN apt-get update \
 && apt-get install --no-install-recommends -y wget ca-certificates git python3 python3-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir --upgrade pip

RUN git clone --depth 1 https://github.com/FMInference/FlexGen.git /usr/src/FlexGen
WORKDIR /usr/src/FlexGen
RUN pip3 install --no-cache-dir -e .
RUN wget https://raw.githubusercontent.com/FMInference/FlexGen/9d888e5e3e6d78d6d4e1fdda7c8af508b889aeae/flexgen/apps/chatbot.py

ENV TRANSFORMERS_CACHE=/cache
ENV HUGGINGFACE_HUB_CACHE=/cache
