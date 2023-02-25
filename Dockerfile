FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*zi
RUN yum install zip httpd unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page288/foste.zip /var/www/html
WORKDIR /var/www/html
RUN unzip foste.zip
RUN rm -rf foste.zip &&\
    cp -rf foste/* . &&\
    rm -rf foste
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
