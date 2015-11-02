#!/bin/bash

echo "Starting cleanup loop..."
while true; do
  echo "$(date +%s) Cleaning up exited containers..."
  docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm
  echo "$(date +%s) Cleaning up dangling images..."
  docker images --no-trunc -q -f dangling=true | xargs -r docker rmi
  echo "$(date +%s) Cleaning up unused images..."

  images=($(docker images | tail -n +2 | awk '{print $1":"$2}'))
  containers=($(docker ps -a | tail -n +2 | awk '{print $2}'))

  containers_reg=" ${containers[*]} "
  remove=()

  for item in ${images[@]}; do
    if [[ ! $containers_reg =~ " $item " ]]; then
      remove+=($item)
    fi
  done

  remove_images=" ${remove[*]} "

  echo ${remove_images} | xargs -r docker rmi

  echo "$(date +%s) Done, waiting another 30 mins before next cleanup..."
  sleep 30m
done
