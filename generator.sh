#!/bin/sh

API_NAME=$1

replace(){
    local replace=$API_NAME

    if [ ! $1 = "./generator.sh" ]; then
      sed -i "s/{{API_NAME_HERE}}/${replace}/g" $1
    fi
}

for f in $(find . -type f); do replace $f; done
