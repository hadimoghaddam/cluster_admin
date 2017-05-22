A new user can be created on clara-1 machine as following:
 Administrator:
  1-  $ sudo adduser netID
  2- go to /etc/passwd and set his home directory as /research/netID
  3- run "$ sudo make -C /var/yp" , to apply changes to NIS
 Client:
  4- Change your password with command : passwd net_id
  5- Create a folder corresponding to your netid in the /research directory
  6- chown -R net_id net_id/
  7- chmod -R 770 net_id/
 mounting condor:
  8- add the following line to ~/.bashrc (vim ~/.bashrc)
            export CONDOR_CONFIG=/research/shared/condor_config
  9- source ~/.bashrc
