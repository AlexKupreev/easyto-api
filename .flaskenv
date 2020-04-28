FLASK_ENV=development
FLASK_APP=easyto_api.app:create_app
SECRET_KEY=changeme
DATABASE_URI=sqlite:////tmp/easyto_api.db
CELERY_BROKER_URL=redis://localhost:6379/1
CELERY_RESULT_BACKEND_URL=redis://localhost:6379/1
