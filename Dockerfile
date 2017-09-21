#
FROM ubuntu:latest
#
MAINTAINER  Oleksiy Dovzhanitsya <oleksdovz@gmail.com>
#
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
#
RUN apt update && \
    apt install -y openssh-server locales && \
    apt clean \
    && locale-gen en_US en_US.UTF-8 cy_GB.UTF-8
#
ADD create_user_run_ssh.sh /usr/local/bin/create_user_run_ssh.sh
#
RUN chmod 777 /usr/local/bin/create_user_run_ssh.sh
#
EXPOSE 22
#
ENTRYPOINT /usr/local/bin/create_user_run_ssh.sh
