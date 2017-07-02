#!/bin/bash

## load xml data to base x

./scripts/run_basex.sh

echo "connecting to db, and import xml data"

docker container run \
		-it \
    --rm \
    --link basex:basex \
    basex/basexhttp:latest bash -c "basexclient -nbasex -c 'create db notenrollen /res/Notenrollen/lido'"
