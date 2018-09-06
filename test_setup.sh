#!/usr/bin/env sh

docker-compose config --quiet
docker-compose up --build --detach
sleep 30