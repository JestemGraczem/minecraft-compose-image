FROM openjdk:8u272-jre-slim-buster

LABEL org.opencontainers.image.authors="Pan Otlet <otlet@jestemgraczem.pl>"

RUN apt-get update && apt-get upgrade -y -qq && apt-get install -y -qq wget bash && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash minecraft

COPY --chown=minecraft:minecraft scripts/ /

WORKDIR /home/minecraft
USER minecraft
RUN [ "bash", "/install" ]
ENTRYPOINT [ "/start" ]