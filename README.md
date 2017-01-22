# docker-nodejs-firefox-chrome
A docker container including Chrome, Firefox, Node 6 and a dummy xserver for 
running browsers. I use this to run karma tests against Firefox and Chrome
in a container.

### Getting a pre-built image
```bash
docker pull rayd/nodejs-firefox-chrome:node6
```

### To initialize the xserver
Inside the container run
```bash
/etc/init.d/xorg-dummy-server start
```

### To build image yourself
```bash
docker build .
```
