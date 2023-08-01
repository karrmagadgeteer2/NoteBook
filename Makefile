venv:
	python -m venv ./venv
	venv/bin/python --version
	venv/bin/python -m pip install --upgrade pip
	venv/bin/pip install poetry==1.5.1

install:
	rm -f poetry.lock
	rm -f requirements.txt
	poetry install
	poetry export --output requirements.txt
	jupyter serverextension enable --py jupyterlab --sys-prefix

clean:
	deactivate
	rm -rf venv
	rm -f poetry.lock
	rm -f requirements.txt
