FROM ubuntu:14.04

RUN echo deb http://archive.ubuntu.com/ubuntu trusty-backports main universe | tee /etc/apt/sources.list.d/backports.list && \
    apt-get update && apt-get install -y rubygems-integration build-essential ruby1.9.1-dev && \
    apt-get install haproxy -t trusty-backports && \
    gem install proxymgr && \
    mkdir -p  /opt/proxymgr/tmp

VOLUME ["/cfg"]

CMD ["proxymgr", "-c", "/cfg/config.yml"]
