venv:
	python -m venv ./venv
	venv/bin/python --version
	venv/bin/python -m pip install --upgrade pip
	venv/bin/pip install poetry==2.1.3

install:
	rm -f poetry.lock
	rm -f requirements.txt
	poetry install --no-root --with dev
	poetry run pre-commit install
	poetry export --output requirements.txt

update:
	poetry update
	poetry export --output requirements.txt

clean:
	rm -rf venv
	rm -f poetry.lock
	rm -f requirements.txt
