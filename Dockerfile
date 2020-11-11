FROM openjdk:8u272-jre-slim-buster

LABEL org.opencontainers.image.authors="Pan Otlet <otlet@jestemgraczem.pl>"

RUN apt-get update && apt-get upgrade -y -qq && rm -rf /var/cache/apt/*

RUN useradd -ms /bin/bash minecraft

COPY --chown=minecraft:minecraft minecraft-files/ /home/minecraft
COPY --chown=minecraft:minecraft scripts/ /

WORKDIR /home/minecraft
USER minecraft
ENTRYPOINT [ "/start" ]