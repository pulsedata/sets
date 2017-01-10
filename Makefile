.DEFAULT_GOAL := default

install-deps:
	pip install -r socrates/requirements.txt
	pip install -r matcher3/requirements.txt
	pip install -r purifiers/requirements.txt

fetch-sets:
	mkdir -p out/originals
	python3 socrates/socrates.py uaij-e68c originals/graduates.json
	python3 socrates/socrates.py id7n-c5cq originals/schools.json

purify:
	mkdir -p out/purified
	python3 purifiers/graduates.py out/originals/graduates.json purified/graduates.json
	python3 purifiers/schools.py out/originals/schools.json purified/schools.json

match:
	python3 matcher3/match.py out/purified/graduates.json out/purified/schools.json

done:
	echo "\033[1mDone. Datasets are now in their corresponding folders in out/. The numbered file is the matcher3 framework output."

clean:
	rm -rf out

default: clean install-deps fetch-sets purify match done