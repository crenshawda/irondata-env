#!/bin/bash

sudo apt-get update

# Oracle JDK - can I automate this?
#sudo apt-get -y install python-software-properties
#sudo add-apt-repository -y ppa:webupd8team/java
#sudo apt-get update
#sudo apt-get -y install oracle-java7-installer

sudo apt-get -y install vim unzip openjdk-7-jdk subversion git #eclipse eclipse-jdt

chmod +x /home/vagrant/id-env.sh
su -c "/home/vagrant/id-env.sh" vagrant
