FROM centos:7
LABEL maintainer=dpyro

# https://github.com/rsyslog/rsyslog-docker/blob/master/base/centos7/Dockerfile
RUN yum -y install wget \
	&& cd /etc/yum.repos.d/ \
    && wget http://rpms.adiscon.com/v8-stable/rsyslog.repo

RUN	yum -y install \
        rsyslog \
        rsyslog-relp \
	&& rm /etc/rsyslog.d/listen.conf

WORKDIR /root

ENV RELAY_TARGET=@localhost
COPY run.sh /root/run.sh
RUN chmod +x /root/run.sh

RUN mkdir -p /var/spool/rsyslog
COPY rsyslog.conf /etc/rsyslog.conf

# traditional syslog reciever UDP
EXPOSE 514/udp
# syslog reciever TCP
EXPOSE 514/tcp
# RELP syslog reciever
EXPOSE 6514/tcp

VOLUME [ "/var/log" ]

# Based on https://github.com/voxxit/dockerfiles/blob/master/rsyslog/Dockerfile

ENTRYPOINT [ "/root/run.sh", "-n" ]