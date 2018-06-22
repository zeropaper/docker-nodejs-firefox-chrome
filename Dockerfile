# Borrowed some from https://github.com/emmenko/docker-nodejs-karma

FROM node:8

MAINTAINER Ray Di Ciaccio <ray@appcues.com>

# Install things in a noninteractive environment so they doesn't ask to be configured.
ENV DEBIAN_FRONTEND noninteractive

ADD keyboard /etc/default/keyboard

RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - ; \
    sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'; \
    apt-get update && apt-get install -yq google-chrome-stable firefox-esr xserver-xorg-core xserver-xorg-video-dummy; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD xorg-dummy-server.sh /etc/init.d/xorg-dummy-server
ADD xorg.conf /etc/X11/xorg.conf

ENV DISPLAY :99.0
ENV CHROME_BIN /usr/bin/google-chrome
