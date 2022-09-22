#!/bin/bash 
sudo yum update 
sudo yum -y install git
sudo yum -y install httpd 
sudo systemctl start httpd
sudo systemctl enable httpd
sudo git clone https://github.com/kp-reddy96/candy-crush.git /var/www/html
