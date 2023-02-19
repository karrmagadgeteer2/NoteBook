venv:
	python3 -m venv ./venv
	venv/bin/python --version
	venv/bin/pip install --upgrade pip
	venv/bin/pip install poetry==1.3.2
	poetry install
	poetry check
