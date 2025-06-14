.ONESHELL:

.PHONY: all install test lint clean

all: install

install:
	python3 -m venv ./venv
	venv/bin/python --version
	venv/bin/python -m pip install --upgrade pip
	venv/bin/pip install poetry==2.1.3
	@. venv/bin/activate && \
	poetry install --no-root --with dev && \
	poetry run pre-commit install && \
	poetry export --output requirements.txt --without-hashes --all-groups

update:
	poetry update --with dev
	poetry export --output requirements.txt --without-hashes --all-groups

clean:
	rm -rf venv
	rm -f poetry.lock
	rm -f requirements.txt
