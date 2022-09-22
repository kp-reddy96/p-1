#!/bin/bash 
sudo yum update
sudo yum -y install git
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd 
sudo git clone https://github.com/kp-reddy96/mario.git /var/www/html
