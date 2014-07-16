#!/bin/bash

# BBPM DB/Tables
mysql -uroot -proot -e "CREATE DATABASE bpmdb;"
mysql -uroot -proot -e "CREATE USER 'bpmadmin'@'localhost' IDENTIFIED BY 'bpmadmin';"
mysql -uroot -proot -e "GRANT ALL ON bpmdb.* to 'bpmadmin'@'localhost';"
mysql -uroot -proot -e "GRANT ALL ON bpmdb.* to 'bpmadmin'@'127.0.0.1';"

cd /home/vagrant
wget -q http://bpmnwithactiviti.org/files/activiti-5.13.zip
unzip activiti-5.13.zip
mysql -uroot -proot bpmdb < activiti-5.13/database/create/activiti.mysql.create.engine.sql
mysql -uroot -proot bpmdb < activiti-5.13/database/create/activiti.mysql.create.history.sql
mysql -uroot -proot bpmdb < activiti-5.13/database/create/activiti.mysql.create.identity.sql
