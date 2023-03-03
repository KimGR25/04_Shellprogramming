#!/bin/bash

# nginx 웹서버설정 
# (1) 패키지 설치(yum install -y nginx)
# (2) 서버 설정 (echo "<h1>nginx Webserver</h1>" > /usr/share/nginx/html/index.html )
# (3) 서비스 기동 (systmectl enable --now nginx.service)
# (4) 방화벽등록
# (5) SELINUX

yum install -y nginx \
&& echo "<h1>hnginx Web server</h1>" > /usr/share/nginx/html/index.html \
&& service nginx restart \
&& echo "[OK] Apache Httpd Web Server started"

curl localhost