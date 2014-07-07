#!/bin/bash

curl -s get.gvmtool.net | bash
source "/home/vagrant/.gvm/bin/gvm-init.sh"
sed -i "s/gvm_auto_answer=false/gvm_auto_answer=true/" /home/vagrant/.gvm/etc/config

gvm install groovy #version
gvm install grails #version
gvm install gradle #version

# Eclipse 4.4
wget http://ftp.osuosl.org/pub/eclipse//technology/epp/downloads/release/luna/R/eclipse-standard-luna-R-linux-gtk-x86_64.tar.gz
tar -xzf eclipse-standard-luna-R-linux-gtk-x86_64.tar.gz
# todo: desktop shortcut?

# GGTS (Eclipse 4.4 Compatible)
wget http://download.springsource.com/release/TOOLS/update/3.5.1.RELEASE/e3.8/springsource-tool-suite-3.5.1.RELEASE-e3.8.2-updatesite.zip
unzip springsource-tool-suite-3.5.1.RELEASE-e3.8.2-updatesite.zip -d ggts
cp -r ggts/features ggts/plugins eclipse

# check out codebase
# hook it into eclipse?
