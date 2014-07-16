#!/bin/bash

# Oracle JDK
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update > /dev/null

echo "oracle-java7-installer	shared/accepted-oracle-license-v1-1	boolean	true" | sudo debconf-set-selections
sudo apt-get -y install oracle-java7-installer
sudo update-java-alternatives -s java-7-oracle
