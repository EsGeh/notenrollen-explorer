#!/bin/bash

# connect to a running basex container for maintenance purposes

docker run -ti \
    --rm \
    --link basex:basex \
    basex/basexhttp:latest basexclient -nbasex
