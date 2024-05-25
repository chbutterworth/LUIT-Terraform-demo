#!/bin/bash

yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service

# echo "Hello World from $(hostname -f) > /var/www/html/index.html

# Add the above line onto this script for basic non-default html with "userdata"

# Note: this project is pulling a customized index.html with a provisoner.
# This is why the last bit of script is written as a in-line comment.