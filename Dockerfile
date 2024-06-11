FROM ubuntu:22.04

ARG user
ARG group=dev
ARG packages=nano

RUN echo user=$user
RUN echo group=$group

RUN apt-get update \
  && apt-get install -y $packages locales openssh-server \
  && rm -rf /var/lib/apt/lists/* \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd

RUN echo 'root:123' | chpasswd

#RUN useradd -m dev && echo 'dev:123' | chpasswd

#USER dev

#COPY id_rsa.pub /home/dev/.ssh/authorized_keys

#USER root

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ls -al /test

#CMD ["/usr/sbin/sshd", "-D"]
