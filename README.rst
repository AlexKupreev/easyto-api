EasyTo API backend
==================

This is a minimalistic ready-to-go API backend using Flask.

Requirements
------------

* poetry
* make (to ease if docker to be used for development/testing)

Configuration
-------------

* Rename and set environment variables:

  * ``.example.env`` -> ``.env`` - development server
  * ``.example.testenv`` -> ``.testenv`` - testing setup

* For docker setup there are specific configuration files (as redis setup is different):

  * ``.dockerenv`` - for environment setup
  * ``.dockertestenv`` - for testing setup

* Specific variables:

  * ``CELERY_BROKER_URL`` - broker connection in format

  .. code::

     redis://:password@hostname:port/db_number

  * ``CELERY_RESULT_BACKEND_URL`` - backend connection in format

  .. code::

     redis://:password@hostname:port/db_number


Development approach
--------------------

There are two possible ways of making development:

1. Using virtual environment (created by poetry)

2. Using docker

They can be taken alone or mixing together.


Development using virtual environment
-------------------------------------

Running the backend
*******************

To have an instance up and running locally:

* Go to

.. code::

    poetry shell

* Init database:

.. code::

    manage db upgrade
    manage init

* Run worker (redis backend should be running - e.g. ``$ redis-server``)

.. code::

    celery worker -A easyto_api.celery_app:app --loglevel=info

* Run development server (will be available at ``http://127.0.0.1:5000/`` or ``http://localhost:5000/``)

.. code::

    manage run

* Alternatively run gunicorn as wsgi server (available at ``http://127.0.0.1:8000``)

.. code::

    gunicorn easyto_api.wsgi:app


Testing and linting
*******************

* Go to

.. code::

    poetry shell

* You can use pytest, tox, as well as flake8 and black like

.. code::

    pytest
    tox
    tox -e lint
    flake8
    black .

* Also you can use them from outside of shell:

.. code::

    poetry run pytest
    poetry run flake8
    poetry run black .


Development using Docker
------------------------

Running the backend
*******************

Use ``make`` from the root project directory (or you can take docker commands from Makefile):

* initializing the instance (backend will be available at ``http://127.0.0.1:5000/`` or ``http://localhost:5000/``):

.. code::

    (sudo) make init

* shutting down the instance:

.. code::

    (sudo) docker-compose down


Testing and linting
*******************

* running all the tests (still not properly working):

.. code::

    (sudo) make test


Credits
-------

* `cookiecutter-flask-restful <https://github.com/karec/cookiecutter-flask-restful>`_
