#!/bin/bash

docker pull redis
docker run --rm --name local-redis -p 6379:6379 -d redis

