#!/bin/bash

## Install basic utilities
sudo apt-get install vim git curl zsh

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

## Ask if dotfiles are to be copied
read -p "Do you wish to install this dotfiles?" yn

### Exit if no
if [ "$1" = "n" ]
then
	exit;
fi

### Install Oh My Zsh

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

### Install SCM Breeze

git clone git://github.com/ndbroadbent/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
source ~/.zshrc 
