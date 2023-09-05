#!/usr/bin/env bash
docker ps -q --filter "name=tc_cmd" | grep -q . && docker stop tc_cmd || true && docker rm tc_cmd || true
export DOCKERHOST=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)
docker-compose run --name tc_cmd tc_cmd