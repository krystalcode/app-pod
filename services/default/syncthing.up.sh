#!/bin/bash

service=$1
buildahfile=$2
run_command=$3
image_name=$4
image_version=$5
image=$6

read -r -d '' run_command_addition << COMMAND
  --volume ${APP_CONTAINER_VOLUMES_DIR}:/var/syncthing \
  ${image}
COMMAND
run_command="${run_command} ${run_command_addition}"

eval ${run_command}
