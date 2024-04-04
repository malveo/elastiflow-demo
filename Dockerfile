FROM elastiflow/flow-collector:6.4.3

USER root

RUN apt-get update && apt-get -y install \
    net-tools iputils-ping tcpdump

USER elastiflow
