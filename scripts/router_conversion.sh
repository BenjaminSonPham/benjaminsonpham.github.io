#!/bin/bash

check_root(){
	if [[ $EUID -ne 0 ]]; then
		echo "This script must be run as root" 
		kill -s TERM $TOP_PID
	fi
}

install_dependencies(){

	install="changeme"

	if [-f /etc/os-release]; then 
		apt update && apt upgrade
		install="apt install -y"

	if [-f /etc/redhat-release]; then 
		dnf update && dnf upgrade
		install="dnf install"

	if [-f /etc/SuSE-release]; then 
		zypper ref && zypper up
		install="zypper -n install"


	#installing the following packages to the server
	$install vim mlocate sudo curl net-tools dnsmasq

}

routerize(){

	interface_out="eth0"
	interface_in="wlan0"

	#configuring static IP address
	echo "
	denyinterfaces $interface_out
	" >> /etc/dhcpcd.conf

	echo "
	auto $interface_out
	allow-hotplug $interface_out
	iface $interface_out inet static 
		address 172.17.7.1
		netmask 255.255.255.0
		network 172.17.7.0
		broadcast 172.17.7.255
	" >> /etc/network/interfaces


	mv /etc/dnsmasq.conf ~/dnsmasq.conf.orig
	echo "
	interface=$interface_out
	listen-address=172.17.7.1
	dhcp-range=172.17.7.2,172.17.2.200,255.255.255.0,12h
	server=1.1.1.1
	bind-interfaces
	domain-needed
	bogus-priv
	" > /etc/dnsmasq.conf





	sed -i.bak s/"#net.ipv4.ip_forward=1"/"net.ipv4.ip_forward=1"/g /etc/sysctl.conf

	iptables -t nat -A POSTROUTING -o $interface_in -j MASQUERADE
}

check_root
install_dependencies
routerize




