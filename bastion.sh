#!/bin/bash
dnf install -y python3-pip
dnf install -y go
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/#Port 22/Port 2023/g' /etc/ssh/sshd_config
echo 'password' | passwd --stdin ec2-user
systemctl restart sshd