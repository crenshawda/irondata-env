#!/bin/bash

sudo apt-get update

# Oracle JDK - can I automate this?
#sudo apt-get -y install python-software-properties
#sudo add-apt-repository -y ppa:webupd8team/java
#sudo apt-get update
#sudo apt-get -y install oracle-java7-installer

sudo apt-get -y install vim unzip openjdk-7-jdk subversion git virtualbox-guest-additions-iso gnome-session-flashback
#sudo bash -c 'echo vboxvideo >> /etc/modules'

# Switch default desktop env to GNOME Fallback
sed -i "s/user-session=ubuntu/user-session=gnome-fallback/" /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

chmod +x /home/vagrant/id-env.sh
su -c "/home/vagrant/id-env.sh" vagrant
