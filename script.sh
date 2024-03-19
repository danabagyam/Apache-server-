#! /bin/bash


#read -p "Enter the service you want to activate: " service

#systemctl=$(systemctl is-active $service)

#if [ $status=="inactive" ]
#then 
#	echo "your service is not active"
#	echo "Done"
#else 
#	echo "It is already active"
#	systemctl enable --now $service
#fi 
dnf install httpd -y
systemctl enable --now httpd
sleep 5

dnf install mysql mysql-server phpmyadmin -y
systemctl enable --now mysqld
sleep 5

firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --reload 
mysql -u root -p

grep local /etc/httpd/conf.d/phpmyadmin.conf

sed s/local/"all granted"/g /etc/httpd/conf.d/phpmyadmin.conf
