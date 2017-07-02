#!/bin/bash

BASEX_DATA="$(pwd)/basexdata"
BASEX_CONTAINER_NAME=basex

if [[ ! -e $BASEX_DATA ]]; then
	mkdir "$BASEX_DATA"
	sudo chmod a+w $BASEX_DATA
fi

container_is_running=$(docker container ls | grep "$BASEX_CONTAINER_NAME")
if [[ $container_is_running != "" ]]; then
	echo "skipping (container already running)"
	exit 0
fi

echo "starting container..."
docker container run -d --name "$BASEX_CONTAINER_NAME" --publish 1984:1984 --publish 8984:8984 --volume "$(pwd)/res:/res" --volume "$BASEX_DATA:/srv/BaseXData" basex/basexhttp:latest
