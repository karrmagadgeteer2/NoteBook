venv:
	python -m venv ./venv
	venv/bin/python --version
	venv/bin/python -m pip install --upgrade pip
	venv/bin/pip install poetry==1.8.3

install:
	rm -f poetry.lock
	rm -f requirements.txt
	poetry install --no-root
	poetry export --output requirements.txt

clean:
	rm -rf venv
	rm -f poetry.lock
	rm -f requirements.txt
