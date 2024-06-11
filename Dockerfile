FROM ubuntu:22.04

RUN apt-get update \
  && apt-get install -y locales openssh-server \
  && rm -rf /var/lib/apt/lists/* \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd

RUN echo 'root:123' | chpasswd

RUN useradd -m dev && echo 'dev:123' | chpasswd

USER dev

COPY id_rsa.pub /home/dev/.ssh/authorized_keys

USER root

CMD ["/usr/sbin/sshd", "-D"]
