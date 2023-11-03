#!/bin/bash
# Author: Prof Legah
# date: sep/12/2022
# Installing Jenkins on RHEL 7/8, CentOS 7/8 or Amazon Linux OS
# You can execute this script as user-data when launching your EC2 VM.
sudo timedatectl set-timezone America/New_York
sudo hostnamectl set-hostname jenkins
sudo yum install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
# Add required dependencies for the jenkins package
sudo yum install java-11-openjdk -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
# start jenkins
# Start Jenkins
# You can enable the Jenkins service to start at boot with the command:
sudo systemctl enable jenkins
#You can start the Jenkins service with the command:=
sudo systemctl start jenkins
# You can check the status of the Jenkins service using the command:
sudo systemctl status jenkins
sudo su - ec2-user
echo "echo of jenkins installation"

~~~~~~~~~~~``~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#!/bin/bash

sudo hostname docker
sudo apt update -y 
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu
sudo systemctl restart docker
sudo systemctl enable docker.service

sudo apt install openjdk-11-jdk -y

sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update && sudo apt install jenkins -y 
sudo systemctl start jenkins

sudo usermod -aG docker jenkins
sudo systemctl restart docker.service
sudo systemctl enable docker.service
sudo echo "jenkins  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/jenkins

sudo echo "jenkins:admin" | chpasswd
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart
sudo usermod -aG docker jenkins
