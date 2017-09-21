#!/bin/bash -x
# Add user
if [ "$SSH_USER" ]  && [[ "$SSH_USER" != 'root' ]]  ; then
    USER_HOME=/home/$SSH_USER
    adduser --quiet \
    --shell /bin/bash \
    --home $USER_HOME \
    --gecos "User" $SSH_USER \
    --disabled-password
else
    SSH_USER=root
    USER_HOME=/root
    sed -i 's/prohibit-password/yes/' /etc/ssh/sshd_config
fi

if [ "$SSH_PASS" ] ; then
    PASS=$SSH_PASS
else
    PASS=root
fi
echo "$SSH_USER:$PASS" | chpasswd


if [ "$SSH_KEY" ] ; then
    mkdir $USER_HOME/.ssh
    echo "$SSH_KEY" > $USER_HOME/.ssh/authorized_keys
    if [ $SSH_USER="root" ];
        then
                sed -i 's/prohibit-password/ without-password/' /etc/ssh/sshd_config
        fi
fi

mkdir -pv /var/run/sshd

/usr/sbin/sshd -D
