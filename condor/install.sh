#!/bin/bash
sudo apt-get install htcondor

mkdir -p /var/condor_local/execute/condor
mkdir -p /var/condor_local/log/condor
mkdir -p /var/condor_local/run/condor
mkdir -p /var/condor_local/spool/condor
mkdir -p /var/condor_local/lib/condor/execute

sudo chown -R condor:condor /var/condor_local/

# you may need to set uid and gid of condor username in the condor_config.local file
cp /research/shared/condor/condor_config.local /var/condor_local/

pkill condor
#sed -i 'g/CONDOR_CONFIG/d' ~/.bashrc
cp /research/shared/condor/condor_config /etc/condor

condor_master
#echo "export CONDOR_CONFIG=/research/shared/condor/condor_config" >> ~/.bashrc
#export CONDOR_CONFIG=/research/shared/condor/condor_config

#sed -i "s/shared\//shared\/condor\//g" ~/.bashrc
#source ~/.bashrc
#pkill condor_master

#condor_master

# necessary packages for running gem5
#apt-get install libtcmalloc-minimal4
#ln -s /usr/lib/libtcmalloc_minimal.so.4 /usr/lib/libtcmalloc.so.4

#sed -i "s/clara-1.csl.illinois.edu/wyatt-9.csl.illinois.edu/g" /var/condor_local/condor_config.local
