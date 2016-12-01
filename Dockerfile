FROM debian

ENV NE_VERSION 8.5.797
ENV NE_URL https://sslvpn.demo.sonicwall.com/NetExtender.Linux.${NE_VERSION}.x86_64.tgz
ENV NOTVISIBLE "in users profile"

RUN apt-get update && \
    apt-get install -y \
      curl \
      file \
      module-init-tools \
      net-tools \
      ppp \
      openssh-server

RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN echo "export VISIBLE=now" >> /etc/profile

RUN curl $NE_URL | tar -xz
WORKDIR netExtenderClient
RUN ./install

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
ENTRYPOINT ["netExtender"]
