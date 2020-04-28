# Setup the project on Debian 10

* install poetry
* init the project:
  ```
  poetry new easyto-api
  ```
* make poetry use python3: 
  ```
  poetry env use python3
  ```
* change python version to :
  ```toml
  [tool.poetry.dependencies]
  python = "^3.7"
  ```
* install dependencies:
  ```
  poetry add flask flask-restful flask-migrate flask-sqlalchemy marshmallow marshmallow-sqlalchemy flask-marshmallow flask-jwt-extended passlib tox pytest factory_boy pytest-factoryboy python-dotenv apispec[yaml] apispec-webframeworks simplejson
  ```
* install celery (redis) and gunicorn
  ```
  poetry add celery[redis] gunicorn
  ```
* use basic file structure from https://github.com/karec/cookiecutter-flask-restful
* setup manage script in `pyproject.toml`:
  ```toml
  [tool.poetry.scripts]
  manage = "easyto_api.manage:cli"
  ```
* install poetry and dependencies to get scripts ready
  ```
  poetry install
  ```
* go to poetry shell and init migrations
  ```
  manage db init
  ```
  no changes needed in `easyto-api/migrations/alembic.ini` for now
* generate initial migration...
  ```
  manage db migrate -m "Initial migration"
  ```
* ... and apply it:
  ```
  manage db upgrade
  ```
* init the project (create admin user)
* to run without docker, need to install redis system-wide. For Debian 10:
    ```
    sudo apt update
    sudo apt install redis-server
    ```
    then slightly adjust it (https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-debian-10):
    1. open with sudo `/etc/redis/redis.conf`
    2. set `supervised systemd`
    3. disable ipv6 to avoid issue with PID on local PC: `bind 127.0.0.1` 
    4. save config file
    5. restart redis `sudo systemctl restart redis`
    6. do not need to start it with the system: `sudo systemctl disable redis`
    7. now it is available as `redis-server` service: e.g. `sudo systemctl status redis-server`
     
* `.flaskenv` is used for cli operations. Added dotenv code to use `.env` for running via wsgi, `.env.testing` - for tests
* updated testing and tox setup
   
*commit 18596119f51e05b2fd7a3e3fde905b292f68409a*

* fixed celery - need to add explicit config loading in `easyto_api/celery_app.py`
* fixed remaining tests - now all presented tests pass
