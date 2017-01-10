FROM centos:latest

MAINTAINER Aharon Nadav Automat-IT  <aharon.nadav@automat-it.com>

# Install Remi Collet's repo for CentOS 7

#ADD ./centos.repo /etc/yum.repos.d/

RUN yum install https://centos7.iuscommunity.org/ius-release.rpm -y 
RUN yum update -y
RUN yum install -y php56u php56u-devel php56u-apc php56u-bcmath php56u-dba php56u-dom php56u-gd php56u-intl php56u-mbstring php56u-mbstring php56u-mcrypt php56u-memcache php56u-mongo php56u-mysql php56u-mysqli php56u-mysqli php56u-pdo php56u-pdo_mysql php56u-posix php56u-proctitle php56u-readline php56u-shmop php56u-simplexml php56u-soap php56u-sysvmsg php56u-sysvsem php56u-sysvshm php56u-wddx php56u-xml php56u-pecl-redis php56u-xmlreader php56u-xmlwriter php56u-fpm redis openssl-devel gcc httpd git mod_ssl

RUN yum install -y wget
#RUN wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && rpm -Uvh remi-release-7.rpm

#  http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

## Clean up YUM when done.
#
## Add Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer
#
RUN yum -y install initscripts && yum clean all

ENV container=docker

#CMD /usr/sbin/apache2ctl -D FOREGROUND

EXPOSE 9000 22 6379 443
