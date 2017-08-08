FROM ubuntu:16.04

RUN apt-get update

# Install Ansible
RUN apt-get install -y software-properties-common git
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt-get update
RUN apt-get install -y ansible
RUN apt-get install curl && apt-get install -y iputils-ping
# Install OpenSSh server
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
ADD index.py /index.py
ADD hosts /etc/ansible/hosts

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
