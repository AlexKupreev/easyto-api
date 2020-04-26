EasyTo API backend
==================

Installation
------------

TODO


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
