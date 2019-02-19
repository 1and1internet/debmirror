FROM ubuntu:latest

MAINTAINER James Eckersall james.eckersall@fasthosts.com

ARG DEBIAN_FRONTEND=noninteractive

COPY files /

ENV \
  SOURCE_SRV=apt.puppetlabs.com \
  SOURCE_DIR=/ \
  DIST="trusty,xenial,bionic" \
  SECTION="dependencies,main,PC1,puppet,puppet5,puppet6" \
  ARCH="i386,amd64" \
  MIRRORDIR="/debmirror" \
  DEBUGFILE="/tmp/debmirror-debug.log" \
  METHOD="https"

RUN \
  apt-get update && apt-get install -o Dpkg::Options::=--force-confdef -y debmirror xz-utils apt-transport-https && \
  chmod 0755 /debmirror_sync.sh && \
  mkdir -p ${MIRRORDIR} && \
  chmod 0777 ${MIRRORDIR}

CMD /debmirror_sync.sh

