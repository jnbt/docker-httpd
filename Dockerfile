FROM httpd:2.4.62

MAINTAINER Jonas Thiel <jonas@thiel.io>

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY server-configs-apache/h5bp /usr/local/apache2/conf/h5bp
