#!/bin/bash

# Kickoff point for the provisioning process
chmod +x /home/vagrant/_provision/id-env.sh
su -c "/home/vagrant/_provision/id-env.sh" vagrant
