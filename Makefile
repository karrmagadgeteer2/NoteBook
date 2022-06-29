venv:
	python3 -m venv ./venv
	. venv/bin/activate
	PYTHONPATH=${PWD} venv/bin/python --version
	PYTHONPATH=${PWD} venv/bin/pip install --upgrade pip
	PYTHONPATH=${PWD} venv/bin/pip install --upgrade -r requirements.txt
	PYTHONPATH=${PWD} venv/bin/pip --version

clean:
			rm -rf venv

.PHONY: test
