#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

curl -s get.gvmtool.net | bash
source "/home/vagrant/.gvm/bin/gvm-init.sh"
sed -i "s/gvm_auto_answer=false/gvm_auto_answer=true/" /home/vagrant/.gvm/etc/config

# GVM (Grails, Groovy, Gradle, etc)
gvm install grails 2.2.4 > /dev/null
gvm install gradle > /dev/null

# GGTS
wget -q http://download.springsource.com/release/STS/3.5.1/dist/e4.3/groovy-grails-tool-suite-3.5.1.RELEASE-e4.3.2-linux-gtk-x86_64.tar.gz
tar -xzf groovy-grails-tool-suite-3.5.1.RELEASE-e4.3.2-linux-gtk-x86_64.tar.gz
# Desktop Shortcut
touch /home/vagrant/Desktop/GGTS.desktop
echo "[Desktop Entry]" >> /home/vagrant/Desktop/GGTS.desktop
echo "Version=3.5.1" >> /home/vagrant/Desktop/GGTS.desktop
echo "Name=GGTS" >> /home/vagrant/Desktop/GGTS.desktop
echo "Exec=/home/vagrant/ggts-bundle/ggts-3.5.1.RELEASE/GGTS" >> /home/vagrant/Desktop/GGTS.desktop
echo "Icon=/home/vagrant/ggts-bundle/ggts-3.5.1.RELEASE/icon.xpm" >> /home/vagrant/Desktop/GGTS.desktop
echo "Terminal=false" >> /home/vagrant/Desktop/GGTS.desktop
echo "Type=Application" >> /home/vagrant/Desktop/GGTS.desktop
echo "Categories=Utility;Application;" >> /home/vagrant/Desktop/GGTS.desktop
chmod +x /home/vagrant/Desktop/GGTS.desktop
#TODO: change Grails/JVM installations to the ones we installed

# Liquibase
wget -q "http://downloads.sourceforge.net/project/liquibase/Liquibase%20Core/liquibase-3.2.0-bin.tar.gz?r=http%3A%2F%2Fwww.liquibase.org%2Fdownload%2F&ts=1404757061&use_mirror=iweb" -O liquibase-3.2.0-bin.tar.gz
mkdir liquibase-3.2.0
tar -xzf liquibase-3.2.0-bin.tar.gz -C liquibase-3.2.0
chmod +x liquibase-3.2.0/liquibase
echo "export PATH=$PATH:/home/vagrant/liquibase-3.2.0/" >> /home/vagrant/.bashrc

# Mysql 5.5
echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get install -y mysql-server

# Prep MySQL
echo "# Case insensitive for Windows inter-op" | sudo tee -a /etc/mysql/my.cnf
echo "[mysqld]" | sudo tee -a /etc/mysql/my.cnf
echo "lower_case_table_names=1" | sudo tee -a /etc/mysql/my.cnf
sudo service mysql restart

# BBPM DB/Tables
mysql -uroot -proot -e "CREATE DATABASE bpmdb;"
mysql -uroot -proot -e "CREATE USER 'bpmadmin'@'localhost' IDENTIFIED BY 'bpmadmin';"
mysql -uroot -proot -e "GRANT ALL ON bpmdb.* to 'bpmadmin'@'localhost';"
mysql -uroot -proot -e "GRANT ALL ON bpmdb.* to 'bpmadmin'@'127.0.0.1';"
wget -q http://bpmnwithactiviti.org/files/activiti-5.13.zip
unzip activiti-5.13.zip
mysql -uroot -proot bpmdb < activiti-5.13/database/create/activiti.mysql.create.engine.sql
mysql -uroot -proot bpmdb < activiti-5.13/database/create/activiti.mysql.create.history.sql
mysql -uroot -proot bpmdb < activiti-5.13/database/create/activiti.mysql.create.identity.sql

# ICM DB/Tables
mysql -uroot -proot -e "CREATE DATABASE icmdb;"
mysql -uroot -proot -e "CREATE USER 'icmadmin'@'localhost' IDENTIFIED BY 'icmadmin';"
mysql -uroot -proot -e "GRANT ALL ON icmdb.* to 'icmadmin'@'localhost';"
mysql -uroot -proot -e "GRANT ALL ON icmdb.* to 'icmadmin'@'127.0.0.1';"

# Prep Code dir
mkdir /home/vagrant/Code

# TODO: Get liquibase code
#cd Code
#svn co https://svn.irondatacorp.com/svn/icm-20/clientApps/wiiris/database/branches/v004/ liquibase
#change the install.sh log level to debug
#sed -i 's/liquibase --defaultsFile=\$1.properties --changeLogFile=install.xml --logLevel=severe update/liquibase --defaultsFile=\$1.properties --changeLogFile=install.xml --logLevel=debug update/' /home/vagrant/Code/liquibase/install.sh
#chmod +x /home/vagrant/Code/liquibase/install.sh
#/home/vagrant/Code/liquibase/install.sh mysql

# TODO: check out codebase
#cd Code
# TODO: get a read-only use to automate checkout and let the devs customize their own svn conf 
#svn checkout https://svn.irondatacorp.com/svn/icm-20 Code
# automate importing this workspace into GGTS?

sudo reboot
