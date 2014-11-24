FROM quay.io/datawerk/centos6:latest

RUN yum --setopt=tsflags=nodocs -y install nfs-utils
RUN wget http://download.gluster.org/pub/gluster/glusterfs/3.6/LATEST/CentOS/glusterfs-epel.repo -O /etc/yum.repos.d/glusterfs-epel.repo
RUN yum --setopt=tsflags=nodocs -y install glusterfs glusterfs-server glusterfs-fuse glusterfs-geo-replication glusterfs-cli glusterfs-api
RUN yum --setopt=tsflags=nodocs -y install attr
RUN yum clean all

ADD gluster /gluster/

RUN chmod +x /gluster/bin/*

CMD ["/gluster/bin/boot"]

EXPOSE 111 2049 24007 24008 24009 38465 38466 38467 49152 49153
