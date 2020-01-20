FROM registry.access.redhat.com/ubi8/ubi:latest
RUN yum install -y java-11-openjdk.x86_64
RUN yum install -y java-11-openjdk-devel.x86_64 maven
ADD s2i /usr/local/bin