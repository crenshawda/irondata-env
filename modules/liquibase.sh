#!/bin/bash

# Liquibase
cd /home/vagrant/
wget -q "http://downloads.sourceforge.net/project/liquibase/Liquibase%20Core/liquibase-3.2.0-bin.tar.gz?r=http%3A%2F%2Fwww.liquibase.org%2Fdownload%2F&ts=1404757061&use_mirror=iweb" -O liquibase-3.2.0-bin.tar.gz
mkdir liquibase-3.2.0
tar -xzf liquibase-3.2.0-bin.tar.gz -C liquibase-3.2.0
chmod +x liquibase-3.2.0/liquibase
echo "export PATH=$PATH:/home/vagrant/liquibase-3.2.0/" >> /home/vagrant/.bashrc
