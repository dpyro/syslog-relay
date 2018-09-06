#!/usr/bin/env sh

docker version
docker-compose version
docker-compose config --quiet
exec docker-compose up --build --detach