#!/bin/bash

# GGTS
cd /home/vagrant
wget -q http://download.springsource.com/release/STS/3.5.1/dist/e4.3/groovy-grails-tool-suite-3.5.1.RELEASE-e4.3.2-linux-gtk-x86_64.tar.gz
tar -xzf groovy-grails-tool-suite-3.5.1.RELEASE-e4.3.2-linux-gtk-x86_64.tar.gz
#wget -q http://download.springsource.com/release/STS/3.6.0/dist/e4.4/groovy-grails-tool-suite-3.6.0.RELEASE-e4.4-linux-gtk-x86_64.tar.gz
#tar -xzf groovy-grails-tool-suite-3.6.0.RELEASE-e4.3.2-linux-gtk-x86_64.tar.gz
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
#TODO: change Groovy/Grails installations to the ones we installed?
