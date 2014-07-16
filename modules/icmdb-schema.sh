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
#./install.sh mysql
