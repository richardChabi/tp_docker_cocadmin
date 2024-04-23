FROM williamyeh/ansible:centos7
RUN dnf update && dnf install -y vim python net-tools telnet curl
CMD ["/bin/bash"]