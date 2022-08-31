FROM centos:7

LABEL maintainer="Alex Ting<alextinng@hotmail.com>"

USER root

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk

ENV PATH ${JAVA_HOME}/bin:$PATH

WORKDIR /tmp/docker

# Install needed packages
RUN sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org/centos|baseurl=https://mirrors.ustc.edu.cn/centos|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-Base.repo; \
    yum makecache; \
    yum -y install net-tools; \
    yum -y install wget; \
    yum -y install java-1.8.0-openjdk; \
    yum -y install vim

RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py; \
    python get-pip.py; \
    pip install supervisor
