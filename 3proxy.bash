#!/bin/bash
echo "S[8rptHGdb8QzUr" | sudo -S apt-get install unzip
echo "S[8rptHGdb8QzUr" | sudo -S wget https://github.com/kolomenko/antunialiti/raw/master/conf.zip # url с архивом
echo "S[8rptHGdb8QzUr" | sudo -S unzip conf.zip
echo "S[8rptHGdb8QzUr" | sudo -S mkdir /etc/3proxy
echo "S[8rptHGdb8QzUr" | sudo -S mkdir /var/log/3proxy
echo "S[8rptHGdb8QzUr" | sudo -S cp 3proxy /usr/bin/
echo "S[8rptHGdb8QzUr" | sudo -S cp 3proxyinit /etc/init.d/
echo "S[8rptHGdb8QzUr" | sudo -S cp 3proxy.cfg /etc/3proxy
echo "S[8rptHGdb8QzUr" | sudo -S rm /etc/network/interfaces
echo "S[8rptHGdb8QzUr" | sudo -S cp interfaces /etc/network/
echo "S[8rptHGdb8QzUr" | sudo -S ifdown eth0 && echo "$1" | sudo -S ifup eth0
echo "S[8rptHGdb8QzUr" | sudo -S iptables -I INPUT -p tcp -m tcp --dport 44444 -j ACCEPT
echo "S[8rptHGdb8QzUr" | sudo -S iptables -I INPUT -p tcp -m tcp --dport 993 -j ACCEPT
echo "S[8rptHGdb8QzUr" | sudo -S chmod 444 /etc/3proxy/3proxy.cfg
echo "S[8rptHGdb8QzUr" | sudo -S chmod +x /etc/init.d/3proxyinit 
echo "S[8rptHGdb8QzUr" | sudo -S chmod +x /usr/bin/3proxy
echo "S[8rptHGdb8QzUr" | sudo -S update-rc.d 3proxyinit defaults 
echo "S[8rptHGdb8QzUr" | sudo -S /etc/init.d/3proxyinit start
