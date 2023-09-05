echo "Stopping docker containers"
docker-compose down
echo "Building docker images"
docker build -t tc_django_base -f base_docker/Dockerfile .
docker build -t tc_django .
echo "Creating docker containers"
export DOCKERHOST=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)
docker-compose up -d db
docker-compose up -d redis
docker-compose up -d celery
docker-compose up -d web_app
