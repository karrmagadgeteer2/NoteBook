venv:
	python3 -m venv ./venv
	venv/bin/python --version
	venv/bin/pip install --upgrade pip
	venv/bin/pip install poetry==1.4.0
	export PYTHONPATH=$PYTHONPATH:${PWD}
	source venv/bin/activate
	poetry install --with dev

active:
	export PYTHONPATH=$PYTHONPATH:${PWD}
	source venv/bin/activate

clean:
	deactivate
	rm -rf venv
