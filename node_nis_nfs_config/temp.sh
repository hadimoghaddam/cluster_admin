#!/bin/bash
sudo cp -R /research/shared/condor /home
sudo echo -e "export CONDOR_CONFIG=/home/condor/condor_config" >> ~/.bashrc
cp .bash_profile ~/
sudo cp rc.local /etc/rc.local
#sudo reboot
