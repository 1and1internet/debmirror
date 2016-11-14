FROM ubuntu:latest

MAINTAINER James Eckersall james.eckersall@fasthosts.com

ARG DEBIAN_FRONTEND=noninteractive

COPY files /

ENV \
  SOURCE_SRV=gb.archive.ubuntu.com \
  SOURCE_DIR=/ubuntu \
  DIST="trusty,trusty-security,trusty-updates,trusty-backports,trusty-proposed" \
  SECTION="main,restricted,universe,multiverse" \
  ARCH="i386,amd64" \
  MIRRORDIR="/debmirror" \
  DEBUGFILE="/tmp/debmirror-debug.log" \
  METHOD="http"

RUN \
  apt-get update && apt-get install -o Dpkg::Options::=--force-confdef -y debmirror xz-utils && \
  chmod 0755 /debmirror_sync.sh && \
  mkdir -p ${MIRRORDIR} && \
  chmod 0777 ${MIRRORDIR}

CMD /debmirror_sync.sh

