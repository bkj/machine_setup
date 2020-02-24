FROM centos:7

ADD machine_setup.sh /machine_setup.sh
RUN bash /machine_setup.sh
