#!/bin/bash
echo "$1" | sudo -S apt-get update 
echo "$1" | sudo -S apt-get upgrade
echo "$1" | sudo -S apt-get install unzip
echo "$1" | sudo -S wget https://github.com/kolomenko/antunialiti/raw/master/conf.zip # url с архивом
echo "$1" | sudo -S unzip conf.zip
echo "$1" | sudo -S mkdir /etc/3proxy
echo "$1" | sudo -S mkdir /var/log/3proxy
echo "$1" | sudo -S cp 3proxy /usr/bin/
echo "$1" | sudo -S cp 3proxyinit /etc/init.d/
echo "$1" | sudo -S cp 3proxy.cfg /etc/3proxy
echo "$1" | sudo -S rm /etc/network/interfaces
echo "$1" | sudo -S cp interfaces /etc/network/
echo "$1" | sudo -S ifdown eth0 && echo "$1" | sudo -S ifup eth0
echo "$1" | sudo -S iptables -I INPUT -p tcp -m tcp --dport 44444 -j ACCEPT
echo "$1" | sudo -S iptables -I INPUT -p tcp -m tcp --dport 993 -j ACCEPT
echo "$1" | sudo -S chmod 444 /etc/3proxy/3proxy.cfg
echo "$1" | sudo -S chmod +x /etc/init.d/3proxyinit 
echo "$1" | sudo -S chmod +x /usr/bin/3proxy
echo "$1" | sudo -S update-rc.d 3proxyinit defaults 
echo "$1" | sudo -S /etc/init.d/3proxyinit start