#!/bin/bash

curl -s get.gvmtool.net | bash
source "/home/vagrant/.gvm/bin/gvm-init.sh"
sed -i "s/gvm_auto_answer=false/gvm_auto_answer=true/" /home/vagrant/.gvm/etc/config

# grails comes packaged with the correct version of groovy
gvm install grails 2.2.4
gvm install gradle

# GGTS
wget http://download.springsource.com/release/STS/3.5.1/dist/e4.3/groovy-grails-tool-suite-3.5.1.RELEASE-e4.3.2-linux-gtk-x86_64.tar.gz
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

# Liquibase
wget "http://downloads.sourceforge.net/project/liquibase/Liquibase%20Core/liquibase-3.2.0-bin.tar.gz?r=http%3A%2F%2Fwww.liquibase.org%2Fdownload%2F&ts=1404757061&use_mirror=iweb" -O liquibase-3.2.0-bin.tar.gz
mkdir liquibase-3.2.0
tar -xzf liquibase-3.2.0-bin.tar.gz -C liquibase-3.2.0
chmod +x liquibase-3.2.0/liquibase
echo "export PATH=$PATH:/home/vagrant/liquibase-3.2.0/" >> /home/vagrant/.bashrc

# Mysql 5.1
#sudo apt-get install -y mysql-server

#TODO: Wrong! Needs to be under [mysqld]
# Prep MySQL
#sudo echo "# Case insensitive for Windows inter-op" >> /etc/mysql/my.cnf
#sudo echo "lower_case_table_names=1" >> /etc/mysql/my.cnf

# ICM DB/Tables
#mysql -u root -e "CREATE DATABASE icmdb;"
#mysql -u root -e "CREATE USER 'icmadmin'@'localhost' IDENTIFIED BY 'icmadmin';"
#mysql -u root -e "GRANT ALL ON icmdb.* to 'icmadmin'@'localhost';"
#mysql -u root -e "GRANT ALL ON icmdb.* to 'icmadmin'@'127.0.0.1';"

# TODO: Get liquibase code
# svn co https://svn.irondatacorp.com/svn/icm-20/clientApps/wiiris/database/branches/v004/ liquibase
# change the install.sh log level to debug
# run the install.sh

# BBPM DB/Tables
#mysql -u root -e "CREATE DATABASE bpmdb;"
#mysql -u root -e "CREATE USER 'bpmadmin'@'localhost' IDENTIFIED BY 'bpmadmin';"
#mysql -u root -e "GRANT ALL ON bpmdb.* to 'bpmadmin'@'localhost';"
#mysql -u root -e "GRANT ALL ON bpmdb.* to 'bpmadmin'@'127.0.0.1';"
#wget http://bpmnwithactiviti.org/files/activiti-5.13.zip
#unzip activiti-5.13.zip
# run the database/create/*mysql* sql scripts

# check out codebase
#mkdir Code
#cd Code
# TODO: get a read-only use to automate checkout and let the devs customize their own svn conf 
#svn checkout https://svn.irondatacorp.com/svn/icm-20 Code

sudo reboot
