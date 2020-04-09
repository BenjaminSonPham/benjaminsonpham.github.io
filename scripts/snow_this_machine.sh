#!/bin/bash 

#configure aliases

touch .bashrc.aliases
printf "ls='ls -c' \nip='ip -c' \ngrep='grep -color' \nls='ls --color=auto'\n" >> .bashrc.aliases

printf "source .basrc.aliases" > .bashrc

#enable colorscheme for this user. use $USER to make things modular


#Check linux distro family


#install the following packages to the server
vim 
mlocate

os-family="SOMETHING"
if [-f /etc/os-release]; then 
	os-family="Debian"

if [-f /etc/redhat-release]; then 
	os-family="Redhat"
