# Variable Defintion
export PKG_DOWN_DIR=/root/bin
export VSFTPD_ftpusers=/etc/vsftpd/ftpusers
export VSFTPD_userlist=/etc/vsftpd/user_list
export SSHD_conf=/etc/ssh/sshd_config


# Function Defintion

function print_good () {
    echo -e "\x1B[01;32m[+]\x1B[0m $1"
}

function print_error () {
    echo -e "\x1B[01;31m[-]\x1B[0m $1"
}

function print_info () {
    echo -e "\x1B[01;34m[*]\x1B[0m $1"
}

#################################################

PkgInst() {
    # input: pkgs
    # output: output string
    # funciton
    PKGS=$*
    # echo $PKGS
    yum -qy install $PKGS >/dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "[ OK ] $PKGS installed. "
    else
        echo "[ FAIL ] $PKGS install FAILED "
        exit 1
    fi 
}

SVC_enable() {
    SVC=$1
    systemctl enable --now $SVC >/dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "[ OK ] $SVC 유닛이 기동되었습니다."
    else
        echo "[ FAIL] $SVC 유닛이 기동되지 않았습니다."
        exit 4
    fi

}

VScodeInst() {
rpm --import https://packages.microsoft.com/keys/microsoft.asc

cat << EOF > /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
    PkgInst "code"
}

VScodeComment() {
    cat << EOF

    * 실행은 다음과 같이 합니다.
      (root 사용자) # code --no-sandbox --user-data-dir=$HOME/workspace
      (일반 사용자) # code
    * 관리자인 경우 alias 설정에서 사용하시면 편합니다.
EOF
}

ChromeInst() {
    ChromePKG=chrome.rpm

    url="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
    wget $url -O $PKG_DOWN_DIR/$ChromePKG  >/dev/null 2>&1

    if [ $? -eq 0 ] ; then
        echo "[ OK ] chrome 다운로드 성공!" 
    else
        echo "[ FIAL ] chrome 다운로드 실패!"
        exit 2
    fi

    yum -y localinstall $PKG_DOWN_DIR/$ChromePKG >/dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "[ OK ] chrome 설치 성공!" 
    else
        echo "[ FIAL ] chrome 설치 실패!"
    fi
}

VSFTP-conf() {
    sed -i 's/^root/#root/' $VSFTPD_ftpusers
	sed -i 's/^root/#root/' $VSFTPD_userlist
    echo "[ OK ] FTP 설정이 완료되었습니다."
}

SSH_conf() {
    sed -i 's/PermitRootLogin no/PermitRootLogin yes/' $SSHD_conf
	sed -i 's/#PermitRootLogin/#PermitRootLogin yes/' $SSHD_conf
	sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' $SSHD_conf
	sed -i 's/#PasswordAuthentication/PasswordAuthentication/' $SSHD_conf
    echo "[ OK ] SSH 설정이 완료되었습니다."
}

Check_Webservice(){
    # input: str(nginx|httpd)
    # output: str(httpd|nginx)
    Web_SVC=$1
    case $Web_SVC in
        nginx) Check_webSVC=httpd ;;
        htppd) Check_webSVC=nginx ;;
    esac
    systemctl disable --now $Check_webSVC >/dev/null 2>&1
}

Nginx_conf() {
    echo "Nginx web server" > /usr/share/nginx/html/index.html
    echo "[ OK ] Web 설정이 완료되었습니다."
}