#!/bin/bash

# Mysql 5.5
echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get install -y mysql-server

# Prep MySQL
echo "# Case insensitive for Windows inter-op" | sudo tee -a /etc/mysql/my.cnf
echo "[mysqld]" | sudo tee -a /etc/mysql/my.cnf
echo "lower_case_table_names=1" | sudo tee -a /etc/mysql/my.cnf
sudo service mysql restart

