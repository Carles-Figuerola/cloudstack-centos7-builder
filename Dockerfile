FROM centos:7.1.1503

RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y groupinstall "Development Tools"
RUN yum -y install java-1.7.0-openjdk-devel.x86_64 genisoimage mysql mysql-server ws-commons-util MySQL-python tomcat createrepo maven

RUN git clone https://github.com/apache/cloudstack.git /root/cloudstack
RUN mkdir /root/cloudstack/dist/
ENV JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk

WORKDIR /root/cloudstack/packaging
CMD git pull origin master && ./package.sh -d centos7
