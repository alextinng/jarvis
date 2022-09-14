FROM alextinng/hadoop:2.10.2

LABEL maintainer="Alex Ting<alextinng@hotmail.com>"

USER root

ENV HIVE_HOME /opt/hive
ENV PATH $PATH:${HIVE_HOME}/bin
ENV HIVE_VERSION 3.1.3
ENV HADOOP_HOME /opt/hadoop

WORKDIR /tmp/docker

ADD etc/ ./

RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz; \
    tar xvf apache-hive-${HIVE_VERSION}-bin.tar.gz; \
    mv apache-hive-3.1.3-bin /opt; \
    rm -rf apache-hive-${HIVE_VERSION}-bin.tar.gz; \
    ln -s /opt/apache-hive-3.1.3-bin/ /opt/hive; \
    mv hive-site.xml $HIVE_HOME/conf; \
    mv hive-env.sh ${HIVE_HOME}/conf; \
    $HIVE_HOME/bin/schematool -dbType derby -initSchema