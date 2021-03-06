#!/bin/sh

API_NAME=$1
MODULE_NAME=$2
DESTINATION_FOLDER=$3

replace(){
    local replace=$API_NAME
    local module_name=$MODULE_NAME

    if [ ! $1 = "./generator.sh" ]; then
      sed -i "s/rest_api_template/${replace}/g" $1
      sed -i "s/RestApiTemplate/${module_name}/g" $1
    fi
}

if [ "$DESTINATION_FOLDER" = "" ]; then
  DESTINATION_FOLDER=$(pwd)/$API_NAME
fi

git clone git@github.com:hugoluchessi/rest_api_template.git $DESTINATION_FOLDER

cd $DESTINATION_FOLDER

mv ./lib/rest_api_template ./lib/$API_NAME
mv ./spec/lib/rest_api_template ./spec/lib/$API_NAME
rm -Rf ./.git
rm -f ./generator.sh
chmod +x ./script/entrypoint.sh
chmod +x ./script/api-docker

for f in $(find . -type f); do replace $f; done
