#!/bin/bash

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update > /dev/null
sudo apt-get -y install debconf-utils

# Oracle JDK - can I automate this?
echo "oracle-java7-installer	shared/accepted-oracle-license-v1-1	boolean	true" | sudo debconf-set-selections
sudo apt-get -y install oracle-java7-installer
sudo update-java-alternatives -s java-7-oracle

sudo apt-get -y install vim unzip subversion git virtualbox-guest-additions-iso gnome-session-flashback

# Switch default desktop env to GNOME Fallback
sed -i "s/user-session=ubuntu/user-session=gnome-fallback/" /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

chmod +x /home/vagrant/id-env.sh
su -c "/home/vagrant/id-env.sh" vagrant
