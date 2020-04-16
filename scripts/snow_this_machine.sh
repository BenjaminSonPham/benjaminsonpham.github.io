#!/bin/bash 

#configure aliases

touch .bashrc.aliases

printf ' alias cls="clear"
 alias ..="cd .."
 alias cd..="cd .."
 alias ls="ls -CF --color=auto"
 alias ll="ls -lisa --color=auto"
 alias home="cd ~"
 alias df="df -ahiT --total"
 alias mkdir="mkdir -pv"
 alias userlist="cut -d: -f1 /etc/passwd"
 alias fhere="find . -name "
 alias free="free -mt"
 alias ps="ps auxf"
 alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
 alias wget="wget -c"
 alias histg="history | grep"
 alias myip="curl http://ipecho.net/plain; echo"
 alias grep="grep --color=auto"
' > .testing_bashrc

printf "source .basrhc.aliases" > .bashrc

#enable colorscheme for this user. use $USER to make things modular


#Check linux distro family

install="changeme"

if [-f /etc/os-release]; then 
	apt update
	install="apt install"

if [-f /etc/redhat-release]; then 
	dnf update
	install="dnf install"

if [-f /etc/SuSE-release]; then 
	zypper refresh
	install="zypper install"


#installing the following packages to the server
vim 
mlocate
