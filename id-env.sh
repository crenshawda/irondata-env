#!/bin/bash

#sed -i "s/user-session=ubuntu/user-session=gnome-fallback/" /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

curl -s get.gvmtool.net | bash
source "/home/vagrant/.gvm/bin/gvm-init.sh"
sed -i "s/gvm_auto_answer=false/gvm_auto_answer=true/" /home/vagrant/.gvm/etc/config

# grails comes packaged with the correct version of groovy
#gvm install groovy #version
gvm install grails 2.2.4
gvm install gradle #version

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

# Chrome Browser
sudo apt-get install -y chromium-browser

#Tomcat 7
#wget http://apache.claz.org/tomcat/tomcat-7/v7.0.54/bin/apache-tomcat-7.0.54.tar.gz
#tar -xzf apache-tomcat-7.0.54.tar.gz
sudo apt-get install -y tomcat7

# Mysql 5.1
#wget http://dev.mysql.com/get/Downloads/MySQL-5.1/mysql-5.1.73-linux-x86_64-glibc23.tar.gz
#tar -xzf mysqul5.1.73-linux-x86_64-glibc23.tar.gz
# 5.1 is a real pain to install-- I can keep looking if there are incompatibilities introduced from the minor versions
sudo apt-get install -y mysql-server

# Liquibase
wget "http://downloads.sourceforge.net/project/liquibase/Liquibase%20Core/liquibase-3.2.0-bin.tar.gz?r=http%3A%2F%2Fwww.liquibase.org%2Fdownload%2F&ts=1404757061&use_mirror=iweb"
mv liquibase-3.2.0-bin.tar.gz\?r\=http%3A%2F%2Fwww.liquibase.org%2Fdownload%2F\&ts\=1404757061\&use_mirror\=iweb liquibase-3.2.0-bin.tar.gz
mkdir liquibase-3.2.0
tar -xzf liquibase-3.2.0-bin.tar.gz -C liquibase-3.2.0

# check out codebase
#mkdir Code
#cd Code
# TODO: get a read-only use to automate checkout and let the devs customize their own svn conf 
#svn checkout https://svn.irondatacorp.com/svn/icm-20 Code

sudo reboot
