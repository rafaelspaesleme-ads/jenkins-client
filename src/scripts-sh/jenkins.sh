#!/bin/bash
# Execute como root

# Instalando JDK
apt-get install openjdk-8-jdk

# Criando server nginx
apt-get install nginx

# Instalando o jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -

sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

apt-get update

apt-get install jenkins

# Pegando senha do Administrador inicial
cat /var/lib/jenkins/secrets/initialAdminPassword


# acessando jenkins 
google-chrome http://localhost:8080