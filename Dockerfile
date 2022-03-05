# Copyright (c) 2019, NVIDIA Corporation. All rights reserved.
#
# This work is made available under the Nvidia Source Code License-NC.
# To view a copy of this license, visit
# https://nvlabs.github.io/stylegan2/license.html

FROM tensorflow/tensorflow:1.14.0-gpu-py3

RUN pip install scipy==1.3.3
RUN pip install requests==2.22.0
RUN pip install Pillow==6.2.1
RUN apt-get install unzip
RUN wget -q -c -nc https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip -qq -n ngrok-stable-linux-amd64.zip
RUN apt-get install -qq -o=Dpkg::Use-Pty=0 openssh-server pwgen > /dev/null
RUN echo root:$password | chpasswd
RUN mkdir -p /var/run/sshd
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc
RUN echo "export LD_LIBRARY_PATH" >> /root/.bashrc
