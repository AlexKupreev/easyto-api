EasyTo API backend
==================

Installation
------------

TODO

* Set Redis connections in ``.env`` and ``.env.testing`` in format::

    redis://:password@hostname:port/db_number

* Run worker::

    celery worker -A easyto_api.celery_app:app --loglevel=info

Running
-------

* Development server (will be available as ``http://127.0.0.1:5000/``)::

    manage run

* Gunicorn as wsgi server (available at ``http://127.0.0.1:8000``)::

    gunicorn easyto_api.wsgi:app


Testing and linting
-------------------

Go to

.. code::

    poetry shell

Then you can use pytest, tox, as well as flake8 and black like

.. code::

    pytest
    tox
    tox -e lint
    flake8
    black

Also you can use them from outside of shell:

.. code::

    poetry run pytest
    poetry run flake8
    poetry run black
