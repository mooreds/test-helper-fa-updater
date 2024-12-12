#!/bin/bash

CONT_ID=`docker ps|grep fusionauth|awk '{print $1}'`
SUCC=`docker logs $CONT_ID |grep -c 'HTTP server started successfully'`
  
while [ "$SUCC" -ne "2" ]; do  
    sleep 5
    echo "sleeping, $SUCC"
    SUCC=`docker logs $CONT_ID |grep -c 'HTTP server started successfully'`
done
docker logs `docker ps|grep fusionauth|awk '{print $1}'`
