#!/bin/bash

BASHRC=$HOME/.bashrc
# BASHRC=/test/bashrc.txt

cat << EOF >> $BASHRC

#########################################
# Sfecific configuration
########################################a#
export PS1='\[\e[34;1m\][\u@\h\[\e[33;1m\] \w]\\$ \[\e[m\]'
 
alias lsf='ls -l | grep "^-"'
alias lsd='ls -l | grep "^d"'
alias ls='ls --color=auto -h -F'
alias c='clear'
alias pps='ps -ef | head -1 ; ps -ef | grep $1'
alias nstate='netstat -antup | head -2 ; netstat -antup | grep $1'
alias vi='/usr/bin/vim'
alias grep='grep --color=auto -i'
alias df='df -h -T'
alias chrome='/usr/bin/google-chrome --no-sandbox'
alias RS='rsync -az --delete -e ssh'
alias LS='rsync -a --delete'
alias fwcmd='firewall-cmd'
alias fwlist='firewall-cmd --list-all'
alias fwreload='firewall-cmd --reload && firewall-cmd --list-all'

#
# vscode alias
#
alias vscode='code --no-sandbox --user-data-dir ~/workspace'
alias aa='chmod 755 /root/bin/*.sh'

#
# DNS Server Alias
#
alias named.conf='vi /etc/named.conf'
alias named.rfc1912.zones='vi /etc/named.rfc1912.zones'
alias DNS='cd /var/named'
alias dnslog='tail -f /var/log/messages'
EOF

source ~/.bashrc