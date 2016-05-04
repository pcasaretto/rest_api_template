#!/bin/sh

API_NAME=$2

replace(){
    local replace=$API_NAME

    if [ ! $1 = "./generator.sh" ]; then
      sed -i "s/{{API_NAME_HERE}}/${replace}/g" $1
    fi
}

git clone git@github.com:ResultadosDigitais/rest_api_template.git $1

for f in $(find . -type f); do replace $f; done
