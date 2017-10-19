FROM centos:7
ENV container docker
RUN yum -y install wget which java-1.8.0-openjdk-devel krb5-workstation
RUN wget -O /etc/yum.repos.d/hdp.repo http://public-repo-1.hortonworks.com/HDP/centos7/2.x/updates/2.6.1.0/hdp.repo 
RUN yum -y remove wget
RUN yum -y install hive spark2 
RUN yum -y update *
RUN yum clean all
RUN curl https://bootstrap.pypa.io/get-pip.py  | python2.7 -
WORKDIR /tmp
ADD requirements.txt /tmp
RUN pip install -r requirements.txt
ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk-1.8.0.144-0.b01.el7_4.x86_64

CMD ["/usr/sbin/init"]

