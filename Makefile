venv:
	python -m venv ./venv
	venv/bin/python --version
	venv/bin/python -m pip install --upgrade pip
	venv/bin/pip install poetry==1.8.3

install:
	rm -f poetry.lock
	rm -f requirements.txt
	poetry install --no-root --with dev
	poetry export --output requirements.txt
	poetry run pre-commit install

clean:
	pre-commit uninstall
	deactivate
	rm -rf venv
	rm -f poetry.lock
	rm -f requirements.txt
