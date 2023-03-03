#!/bin/bash

# http 웹서버설정 
# (1) 패키지 설치(yum install -y httpd mod_ssl)
# (2) 서버 설정 (echo "<h1>httpd Webserver</h1>" > /var/www/html/index.html )
# (3) 서비스 기동 (systmectl enable --now httpd.service)

yum install -y httpd mod_ssl \
&& echo "<h1>httpd Web server</h1>" > /var/www/html/index.html \
&& service httpd restart \
&& echo "[OK] Apache Httpd Web Server started"
