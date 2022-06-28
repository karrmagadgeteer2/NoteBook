.PHONY: test

venv: requirements.txt
	python3 -m venv ./venv
	venv/bin/pip install --upgrade -r requirements.txt

clean:
	rm -rf dist
	rm -rf openseries.egg-info
	rm -rf venv
