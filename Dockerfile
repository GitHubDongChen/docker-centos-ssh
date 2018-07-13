FROM centos

MAINTAINER ydrdy "dongchen0530@hotmail.com"

RUN yum install -y openssh-server \
	&& echo 'helloworld' | passwd root --stdin \
	&& ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key \
	&& ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key \
	&& ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key \
	&& ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key \
	&& mkdir /var/run/sshd \
	&& yum clean all \
	&& rm -rf /var/cache/yum 

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
