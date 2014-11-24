FROM quay.io/datawerk/centos6:latest

RUN yum --setopt=tsflags=nodocs -y install nfs-utils glusterfs-server glusterfs-geo-replication glusterfs-cli
RUN yum clean all

ADD gluster /gluster/

RUN chmod +x /gluster/bin/*

CMD ["/gluster/bin/boot"]

EXPOSE 111 2049 24007 24008 24009 38465 38466 38467 49152 49153
