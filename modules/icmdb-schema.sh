#!/bin/bash

# ICM DB/Tables
mysql -uroot -proot -e "CREATE DATABASE icmdb;"
mysql -uroot -proot -e "CREATE USER 'icmadmin'@'localhost' IDENTIFIED BY 'icmadmin';"
mysql -uroot -proot -e "GRANT ALL ON icmdb.* to 'icmadmin'@'localhost';"
mysql -uroot -proot -e "GRANT ALL ON icmdb.* to 'icmadmin'@'127.0.0.1';"

mkdir /home/vagrant/Code
cd Code
#svn co https://svn.irondatacorp.com/svn/icm-20/clientApps/wiiris/database/branches/v004/ liquibase
# change the install.sh log level to debug
#sed -i 's/liquibase --defaultsFile=\$1.properties --changeLogFile=install.xml --logLevel=severe update/liquibase --defaultsFile=\$1.properties --changeLogFile=install.xml --logLevel=debug update/' /home/vagrant/Code/liquibase/install.sh
#chmod +x /home/vagrant/Code/liquibase/install.sh
#cd liquibase
#./dropAll.sh mysql
#./install.sh mysql
#./update.sh mysql

# Automate the workbook data-upload
#cd /home/vagrant/Code/
# Schema
#svn co https://svn.irondatacorp.com/svn/icm-20/clientApps/wiiris/database/trunk/ icmdb-schema
# Data
#svn co https://svn.irondatacorp.com/svn/everest/artifacts/wiiris/trunk/technical/database/dataLoad/ icmdb-data
# Utility 
#svn co https://svn.irondatacorp.com/svn/icm-20/clientApps/wiiris/wiiris-dataload/trunk icmdb-dataloader
#cd icmdb-dataloader
#grails run-app

#Load Order-
#1- baseRefDataICM.xlsx
#2- baseRefDataIRIS.xlsx
#3- qaBaseRefDataIRIS.xlsx
#4- Postcode1.xlsx  **

#curl -XPOST -F file=@/vagrant/Code/icmdb-data/xxx.xlsx http://localhost:8080/wiiris-dataload/dataload/upload

# stop the app-server?
#grails stop-app?
