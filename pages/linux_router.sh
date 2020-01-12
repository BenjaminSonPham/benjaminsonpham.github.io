#!/bin/bash

# #Detects if script are not running as root... 
# if [ "$UID" != "0" ]; then
#    #$0 is the script itself (or the command used to call it)...
#    #$* parameters...
#    if whereis sudo &>/dev/null; then
#      echo "Please type the sudo password for the user $USER"
#      sudo $0 $*
#      exit
#    else
#      echo "Sudo not found. You will need to run this script as root."
#      exit
#    fi 
# fi

# #enable forwarding
# sysctl -w net.ipv4.ip_forward=1

# #permanent forwarding

# echo 'net.ipv4.ip_forward=1
# net.ipv6.conf.all.forwarding=1' > /etc/sysctl.d/forwarding.conf

#Extract all the interfaces
interfaces_string_list=$(ip link | awk -F : '$0 !~ "lo|docker|vmnet|vir|^[^0-9]"{print $2;getline}')

#sanitize the interfaces for my specific 

enp0s20f0u1
ens20u1u2u1
s=0 
interfaces=()
for i in $interfaces_string_list
do 
	echo $i

done




#configure routing

#install dnsmasq for dhcp 

