cd ../flask_services
git pull origin staging
docker-compose down
docker-compose up -d ai_api
cd ../thumbcrowd
