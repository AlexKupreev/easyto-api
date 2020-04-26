from easyto_api.app import init_celery

app = init_celery()
app.conf.imports = app.conf.imports + ("easyto_api.tasks.example",)
