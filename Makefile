venv:
	python3 -m venv ./venv
	. venv/bin/activate
	PYTHONPATH=${PWD} venv/bin/pip install --upgrade pip
	PYTHONPATH=${PWD} venv/bin/pip install --upgrade -r requirements.txt

clean:
	rm -rf venv

.PHONY: test
