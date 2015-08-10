#!/bin/bash

## Install Vim and Git
sudo apt-get install vim git curl

## LAMP Stack
sudo apt-get install apache2 php5 mysql-server libapache2-mod-auth-mysql php5-mysql libapache2-mod-php5 php5-mcrypt php5-curl phpmyadmin

### Enable PHP Mcrypt extension
sudo phpenmod mcrypt

## Install Terminator
sudo add-apt-repository -y ppa:gnome-terminator
sudo apt-get update
sudo apt-get -y install terminator

### Add terminator config
cp configs/terminator/config ~/.config/terminator
