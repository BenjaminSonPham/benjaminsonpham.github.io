#!/bin/bash

trap "exit 1" TERM
export TOP_PID=$$

check_root(){
	if [[ $EUID -ne 0 ]]; then
		echo "This script must be run as root" 
		kill -s TERM $TOP_PID
	fi
}

create_script(){

	mkdir /opt/snow &
	printf "

echo 'auto lo 
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

' > /etc/network/interface

while(! eval(systemctl status networking | grep 'active'));
do 
	systemctl restart networking;
done

while ! systemctl status networking | grep 'active'; do echo "restarting..."; systemctl restart networking; done

	" > /opt/snow/networking-ipv6-fix.sh

}


create_daemon(){
	printf "
	[Unit]
Description=IPv6 workaround
After=network.target
StartLimitIntervalSec=0
[Service]
Type=simple
Restart=always
RestartSec=1
User=root
ExecStart=/opt/snow/networking-ipv6-fix.sh

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/networking-fix.service

}

check_root
create_script
create_daemon
