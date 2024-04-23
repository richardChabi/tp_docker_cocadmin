FROM centos7
RUN yum install -y python3 \
    && mkdir /var/run/sshd \
    && echo 'root:ansible' | chpasswd \
    && sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    #ssh login fix
RUN sed 's@Session\s*required\s*pamloginuid.so@session optional pamloginuid.so@' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]