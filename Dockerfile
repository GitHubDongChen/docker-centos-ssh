FROM centos:7.5.1804

LABEL ydrdy "dongchen0530@hotmail.com"

ADD CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 \
	&& rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Debug-7 \
	&& rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Testing-7

RUN yum clean all \
	&& rm -rf /var/cache/yum

RUN yum install -y openssh-server

RUN echo 'helloworld' | passwd root --stdin

RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key \
	&& ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key \
	&& ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key \
	&& ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key \
	&& mkdir /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
