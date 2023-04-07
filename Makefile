venv:
	python -m venv ./venv
	venv/bin/python --version
	venv/bin/python -m pip install --upgrade pip
	venv/bin/pip install poetry==1.4.2

install:
	poetry install --with dev

clean:
	deactivate
	rm -rf venv