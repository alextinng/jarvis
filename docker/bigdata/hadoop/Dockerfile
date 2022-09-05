FROM alextinng/centos:7

LABEL maintainer="Alex Ting<alextinng@hotmail.com>"

USER root

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk

ENV HADOOP_VER 3.3.4
ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_CONF_DIR /opt/hadoop/etc/hadoop

ENV PATH $HADOOP_HOME/bin:${JAVA_HOME}/bin:$PATH

WORKDIR /tmp/docker

# Apache Hadoop
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VER}/hadoop-${HADOOP_VER}.tar.gz; \
    tar xvf hadoop-${HADOOP_VER}.tar.gz; \
    mv hadoop-${HADOOP_VER} /opt; \
    ln -s /opt/hadoop-${HADOOP_VER} /opt/hadoop

# Custom configurations
ADD etc/hadoop/core-site.xml $HADOOP_CONF_DIR
ADD etc/hadoop/hadoop-env.sh $HADOOP_CONF_DIR
ADD etc/hadoop/hdfs-site.xml $HADOOP_CONF_DIR
ADD etc/supervisord.conf /etc

RUN useradd -p 'jokes@2022' hadoop; \
    chown hadoop:hadoop -R ${HADOOP_HOME}/; \
    ${HADOOP_HOME}/bin/hdfs namenode -format --non-interactive;

EXPOSE 9870

ENTRYPOINT ["supervisord", "-c", "/etc/supervisord.conf", "-n"]