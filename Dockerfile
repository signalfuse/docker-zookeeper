# Dockerfile for ZooKeeper

FROM quay.io/signalfuse/signalfx-base:alp-3.8-jdk8
MAINTAINER Maxime Petazzoni <max@signalfx.com>

# Get latest stable release of ZooKeeper
RUN wget -q -O - https://www.apache.org/dist/zookeeper/zookeeper-3.5.4-beta/zookeeper-3.5.4-beta.tar.gz \
  | tar -C /opt -xz

ADD run.py /opt/zookeeper-3.5.4-beta/.docker/
ADD entrypoint.sh /opt/zookeeper-3.5.4-beta/.docker/
ADD zkOk.sh /opt/zookeeper-3.5.4-beta/
ADD preStop.sh /opt/zookeeper-3.5.4-beta/
ADD postStart.sh /opt/zookeeper-3.5.4-beta/

WORKDIR /opt/zookeeper-3.5.4-beta/
ENTRYPOINT [".docker/entrypoint.sh"]
CMD ["python", "/opt/zookeeper-3.5.4-beta/.docker/run.py"]
