FROM node:9-slim

ADD ./instantclient_12_2 /tmp/instantclient_12_2

RUN apt-get -y update && apt-get install -y libaio1 \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /opt/oracle/instantclient \
 && mv /tmp/instantclient_12_2/* /opt/oracle/instantclient/ \
 && rm -rf /tmp/instantclient_12_2 \
 && cd /opt/oracle/instantclient \
 && ln -s libclntsh.so.12.1 libclntsh.so \
 && ln -s libocci.so.12.1 libocci.so \
 && echo /opt/oracle/instantclient > /etc/ld.so.conf.d/oracle-instantclient.conf

ENV LD_LIBRARY_PATH="/opt/oracle/instantclient"