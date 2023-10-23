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

	interface_LAN="eth0"
	interface_WAN="wlan0"

	#configuring static IP address
	echo "
	interface $interface_LAN
	static ip_address=172.17.7.1/24
	static routers=192.168.0.1
	static domain_name_servers=192.168.0.1
	" >> /etc/dhcpcd.conf


	#Configuring DHCP for $interface_LAN
	mv /etc/dnsmasq.conf ~/dnsmasq.conf.orig
	echo "
	interface=$interface_LAN
	listen-address=172.17.7.1
	dhcp-range=172.17.7.2,172.17.2.200,255.255.255.0,12h
	server=1.1.1.1
	bind-interfaces
	domain-needed
	bogus-priv
	" > /etc/dnsmasq.conf



	#Enabling ip forwarding in the kernel

	sed -i's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf

	#Iptables configurations

	iptables -t nat -A POSTROUTING -o $interface_WAN -j MASQUERADE
	iptables -A FORWARD -i $interface_WAN -o $interface_LAN -m state --state RELATED,ESTABLISHED -j ACCEPT
	iptables -A FORWARD -i $interface_LAN -o $interface_WAN -j ACCEPT  

}

check_root
install_dependencies
routerize




