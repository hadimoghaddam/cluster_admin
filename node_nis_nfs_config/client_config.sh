#!/bin/bash
sudo apt-get install portmap nis
sudo apt-get install vim
# gem5 necessary files + compilers
sudo apt-get install swig gcc m4 python python-dev libgoogle-perftools-dev mercurial zlib1g-dev scons g++ gfortran build-essential git protobuf-compiler libprotobuf-dev libboost-all-dev freeglut3-dev tmux cmake

sudo cp -R /research/shared/condor /home
sudo echo -e "export CONDOR_CONFIG=/home/condor/condor_config" >> ~/.bashrc
cp .bash_profile ~/
sudo cp rc.local /etc/rc.local

cd condor
sudo ./install.sh


sudo echo -e "ICSL_Lab1" > /etc/defaultdomain
sudo echo -e "+::::::" >> /etc/passwd
sudo echo -e "+:::" >> /etc/group
sudo echo -e "+::::::::" >> /etc/shadow
sudo echo -e "domain ICSL_Lab1 server 192.17.100.88" > /etc/yp.conf
sudo echo -e "alyssa1.csl.illinois.edu:/research /research nfs auto,nolock,nfsvers=3 0 0" >> /etc/fstab

sudo echo -e "ALL : 127.0.0.0/255.255.0.0 : allow\n" > /etc/hosts.allow
sudo echo -e "ALL : 130.126.0.0/255.255.0.0 : allow\n" >> /etc/hosts.allow
sudo echo -e "ALL : 192.17.0.0/255.255.0.0 : allow\n" >> /etc/hosts.allow
sudo echo -e "ALL : ALL\n" > /etc/hosts.deny

sudo echo -e "255.255.0.0       127.0.0.0\n" > /etc/ypserv.securenets
sudo echo -e "255.255.0.0       192.17.0.0\n" >> /etc/ypserv.securenets
sudo echo -e "255.255.0.0       130.126.0.0\n" >> /etc/ypserv.securenets

#sudo mount -t nfs alyssa1.csl.illinois.edu:/research /research 
sudo cp /research/shared/node_nis_nfs_config/nsswitch.conf /etc/nsswitch.conf 
sudo reboot
