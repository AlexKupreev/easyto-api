import os

from dotenv import load_dotenv
from easyto_api.app import init_celery

env_path = os.path.join(os.path.dirname(__file__), "..", ".env")
load_dotenv(dotenv_path=env_path)

app = init_celery()
app.conf.imports = app.conf.imports + ("easyto_api.tasks.example",)
