FROM quay.io/datawerk/centos6:latest

RUN yum --setopt=tsflags=nodocs -y install nfs-utils
RUN wget http://download.gluster.org/pub/gluster/glusterfs/3.6/LATEST/CentOS/glusterfs-epel.repo -O /etc/yum.repos.d/glusterfs-epel.repo
RUN yum --setopt=tsflags=nodocs -y install glusterfs glusterfs-server glusterfs-fuse glusterfs-geo-replication glusterfs-cli glusterfs-api
RUN yum --setopt=tsflags=nodocs -y install attr
RUN yum clean all

ADD bin /gluster/

RUN chmod +x /gluster/bin/*

CMD ["/gluster/bin/boot"]
