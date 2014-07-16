#!/bin/bash

curl -s get.gvmtool.net | bash
source "/home/vagrant/.gvm/bin/gvm-init.sh"
sed -i "s/gvm_auto_answer=false/gvm_auto_answer=true/" /home/vagrant/.gvm/etc/config

# GVM (Grails, Groovy, Gradle, etc)
# TODO: Find a way to quiet the 'progress bar'?
gvm install grails 2.2.4
gvm install gradle
