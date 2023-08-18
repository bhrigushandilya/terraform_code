#!/bin/bash
sudo su -
yum update -y 
yum install httpd -y 
echo "This is from $(hostname) instance" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd