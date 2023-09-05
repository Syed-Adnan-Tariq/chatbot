run:
	@./manage.py runserver 0.0.0.0:8000

migrate:
	@./manage.py migrate --noinput

migration:
	@./manage.py makemigrations $(app)

collectstatic:
	@./manage.py collectstatic --noinput --verbosity=0

compress:
	@./manage.py compress --extension=".haml" --settings=temba.settings_compress --verbosity=0

run-app:
	gunicorn --bind 0.0.0.0:8000 temba.wsgi --workers 10 --timeout 600

run-celery:
	celery -A temba worker -l info -Q flows,msgs,handler,celery -c 2 --autoscale=1,4

create-data-files:
	python3 -m ai.scripts.create_data_files

update_domain_files:
	python3 -m ai.scripts.update_domain_files

update_config_nlu:
	python3 -m ai.scripts.update_config_nlu

sync_small_talk:
	python3 -m ai.scripts.sync_small_talk

train-core:
	python3 -m ai.scripts.tc_cmd --mode train-core --name=$(name)

# e.g. make train-nlu name=lab

train-nlu:
	python3 -m ai.scripts.tc_cmd --mode train-nlu --name=$(name)

# e.g. make train-nlu name=coffee_shop

run-endpoint:
	python3 -m ai.scripts.tc_cmd --mode run-endpoint --name=$(name)

# e.g. make run-endpoint name=coffee_shop

run-bot-shell:
	python3 -m ai.scripts.tc_cmd --mode run-bot-shell --name=$(name)

# e.g. make run-bot-shell name=coffee_shop

run-bot-backend:
	python3 -m ai.scripts.tc_cmd --mode run-bot-backend --name=$(name)

# e.g. make run-bot-backend name=coffee_shop

train-core-nlu:
	python3 -m ai.scripts.tc_cmd --mode train-core-nlu --name=$(name)

# e.g. make train-core-nlu name=coffee_shop
