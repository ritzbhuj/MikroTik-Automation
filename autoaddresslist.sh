#!/bin/bash
#Date: 2020-09-16
#By: ritzbhuj
#Desc: Script to automatically create addresslist with external list of IP addresses/subnets

#Declarations:#######
mikUsername="XXXXXXX" #->Mikrouterusername
mikPassword="XXXXXXX" #->Mikrouterpassword
mikIP="192.xxx.xxx.xxx" # IP address of mik router
#address=#placemarker
list="priority-web" # -> Your address list name on mik router
####################
for address in $(cat populatelist);
do
    echo -e ${address};
    sshpass -p ${mikPassword} ssh -o StrictHostKeyChecking=no -p 2222 ${mikUsername}@${mikIP} ip firewall address-list add address=${address} list=${list};
done
