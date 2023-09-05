#!/usr/bin/env bash
docker-compose down
export DOCKERHOST=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)
docker-compose up -d db
docker-compose up -d redis
docker-compose up -d celery_ai
docker-compose run -p 8000:8000 --name tc_app tc_cmd