#!/bin/bash

. /root/bin/functions.sh

# 1) telnet
    echo "########## TelNet Server ##########"
    PkgInst "telnet telnet-server"
    SVC_enable "telnet.socket"
# 2) ftp
    echo "########## FTP Server ##########"
    PkgInst "vsftpd ftp"
    VSFTP-conf
    SVC_enable "vsftpd.service"
# 3) ssh
    echo "########## SSH Server ##########"
    PkgInst "openssh-server openssh-clients openssh"
    SSH_conf
    SVC_enable "sshd.service"
# 4) nginx web server
    echo "########## Web Server ##########"
    Check_Webservice "nginx"
    PkgInst "nginx"
    Nginx_conf
    SVC_enable "nginx.service"