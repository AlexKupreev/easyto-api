# use this for development only
FROM python:3.7-slim-buster
RUN mkdir /app
WORKDIR /app

ENV POETRY_VERSION=1.0.5 \
    POETRY_VIRTUALENVS_CREATE=false

# System deps:
RUN pip install "poetry==$POETRY_VERSION"

EXPOSE 5000

# Ensure poetry config has up-to-date deps:
COPY pyproject.toml poetry.lock /

# Project initialization:
RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi

# Copy specified folders into image
# TODO adjust to copy only necessary folders
COPY easyto_api /

ENV PYTHONPATH "${PYTHONPATH}:/app/easyto_api:/app/tests"

# Run server in dev mode
CMD ["flask", "run"]
