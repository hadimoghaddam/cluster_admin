#!/bin/bash
cd /research
DIR=/research
RESEARCHSIZE=6000000000 #research cap is 6TB
USERSIZE=1500000000 #per user cap is 1.5TB
SHAREDSIZE=2000000000 #shared cap is 2TB

ATTEN='ATTENTION IS NECESSARY:\n'
while true; do
  let a=0
  if [ $(du -s $DIR | awk '{print $1}') -gt $RESEARCHSIZE ]; then
    M="$DIR "$(du -s $DIR | awk '{print $1}')"KB\n"
    #echo  $ATTEN$'\n'$M
    let a=1
  fi
  for i in `ls .`
  do
    if [ $i == "shared" ]; then

      if [ $(du -s $DIR/$i | awk '{print $1}') -gt $SHAREDSIZE ]; then
        M=$M"$DIR/$i "$(du -s $DIR/$i | awk '{print $1}')"KB\n"
        let a=1
      fi
    elif [ $(du -s $DIR/$i | awk '{print $1}') -gt $USERSIZE ]; then
      M=$M"$DIR/$i "$(du -s $DIR/$i | awk '{print $1}')"KB\n"
      let a=1
    fi
  done

  if [ $a == 1 ]; then
    echo -e $ATTEN$M | mail -s "Alyssa Informer" asghari2@illinois.edu malian2@illinois.edu zliu118@illinois.edu abulila2@illinois.edu
    M=""
    let a=0
  fi
  sleep 86400
done
