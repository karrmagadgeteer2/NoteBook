venv:
	python -m venv ./venv
	venv/bin/python --version
	venv/bin/python -m pip install --upgrade pip
	venv/bin/pip install poetry==1.4.2

install:
	rm -f poetry.lock
	rm -f requirements.txt
	poetry install
	poetry export --output requirements.txt

clean:
	deactivate
	rm -rf venv
	rm -f poetry.lock
	rm -f requirements.txt
