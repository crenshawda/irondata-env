#!/bin/bash

# Switch default desktop env to GNOME Fallback
sudo apt-get -y install gnome-session-flashback
sudo sed -i "s/user-session=ubuntu/user-session=gnome-fallback/" /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

sudo reboot
