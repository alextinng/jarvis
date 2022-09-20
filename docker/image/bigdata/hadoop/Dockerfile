FROM openjdk:8

LABEL maintainer="Alex Ting<alextinng@hotmail.com>"

USER root

ENV HADOOP_VER 2.10.2
ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_CONF_DIR /opt/hadoop/etc/hadoop

ENV PATH $HADOOP_HOME/bin:${JAVA_HOME}/bin:$PATH

WORKDIR /tmp/docker

# copy supervisor
COPY --from=ochinchina/supervisord:latest /usr/local/bin/supervisord /usr/bin/supervisord

# Apache Hadoop
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-${HADOOP_VER}/hadoop-${HADOOP_VER}.tar.gz --no-check-certificate; \
    tar xvf hadoop-${HADOOP_VER}.tar.gz; \
    mv hadoop-${HADOOP_VER} /opt; \
    ln -s /opt/hadoop-${HADOOP_VER} /opt/hadoop; \
    rm -rf xvf hadoop-${HADOOP_VER}.tar.gz

# Custom configurations
ADD etc/hadoop/ $HADOOP_CONF_DIR
ADD etc/supervisord.conf /etc

RUN useradd -p 'jokes@2022' hadoop; \
    chown hadoop:hadoop -R ${HADOOP_HOME}/; \
    ${HADOOP_HOME}/bin/hdfs namenode -format --non-interactive;

EXPOSE 9870

ENTRYPOINT ["supervisord", "-c", "/etc/supervisord.conf"]