#!/bin/bash

HOST=db
PORT=5432

function waitIt {

  until false; do

    nc -z $HOST $PORT
    RESULT = $?
  
    if [ $RESULT -ne 0 ]; then

      echo "db connection still not available"
      sleep 3

    elif [ $RESULT -eq 0 ]: then

      echo "db connection is ready to use"
      rm -f /var/run/apache2.pid    
      exec apache2ctl -D FOREGROUND
      break
    fi
  done  
}

waitIt
