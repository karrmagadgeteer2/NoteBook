venv:
	python -m venv ./venv
	venv/bin/python --version
	venv/bin/python -m pip install --upgrade pip
	venv/bin/pip install poetry==1.7.1

install:
	rm -f poetry.lock
	rm -f requirements.txt
	poetry config warnings.export false
	poetry install --no-root
	poetry export --output requirements.txt

clean:
	deactivate
	rm -rf venv
	rm -f poetry.lock
	rm -f requirements.txt
