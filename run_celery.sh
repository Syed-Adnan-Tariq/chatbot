#!/usr/bin/env bash
docker stop tc_celery_beat && docker rm tc_celery_beat
docker stop tc_celery && docker rm tc_celery
docker stop tc_celery_default && docker rm tc_celery_default
docker-compose up -d celery_beat
docker-compose up -d celery
docker-compose up -d celery_default
