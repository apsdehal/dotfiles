#!/bin/bash

## Install basic utilities
sudo apt-get install -y vim git curl zsh

## LAMP Stack
sudo apt-get install -y apache2 php5 mysql-server libapache2-mod-auth-mysql php5-mysql libapache2-mod-php5 php5-mcrypt php5-curl phpmyadmin

# Install Redis
sudo apt-get install -y redis-server

### Enable PHP Mcrypt extension
sudo php5enmod mcrypt

## Install Terminator
sudo add-apt-repository -y ppa:gnome-terminator
sudo apt-get update
sudo apt-get -y install terminator

### Add terminator config
mkdir ~/.config/terminator
cp configs/terminator/config ~/.config/terminator/

## Install Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

## Copy jupyter config
## Eventually we should have jupyter via anaconda
mkdir -p ~/.jupyter/custom
cp configs/jupyter/custom/custom.js ~/.jupyter/custom/

## Add ap-hotspot
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get -y install ap-hotspot

## Ask if dotfiles are to be copied
read -p "Do you wish to install copy dotfiles? (y/n)" yn

### Exit if no
if [ "$yn" = "n" ]
then
	exit;
fi

### Install SCM Breeze

git clone git://github.com/ndbroadbent/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
source ~/.zshrc

## Install NVM

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash

read -p "Want vagrant? (y/n)" yn

### Exit if no
if [ "$yn" = "y" ]
then

## Install Anaconda

curl -o- https://repo.continuum.io/archive/Anaconda3-5.0.0.1-Linux-x86_64.sh | bash

## Install Vagrant
cd ~/Downloads;
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_x86_64.deb;
sudo dpkg -i vagrant_1.7.4_x86_64.deb
cd -;

fi

### Install Oh My Zsh

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
