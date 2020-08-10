.PHONY: init init-migration build run db-migrate db-upgrade test lint

init:  build run
# do we need 'migrate' here?
	docker-compose exec web python ./easyto_api/manage.py db upgrade
	docker-compose exec web python ./easyto_api/manage.py init
	@echo "Init done, containers running"

build:
	docker-compose build

run:
	docker-compose up -d

db-migrate:
	docker-compose exec web python ./easyto_api/manage.py db migrate

db-upgrade:
	docker-compose exec web python ./easyto_api/manage.py db upgrade

test:
# 	FIXME user tests do not pass with `fixture 'user_factory'/'user' not found`
	docker-compose --env-file=.dockertestenv run --rm web pytest

lint:
	docker-compose run web tox -e lint
