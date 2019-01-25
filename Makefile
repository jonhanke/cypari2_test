
build:
	docker build -t cypari2_test .

clean:
	docker system prune


run: run_python_init


run_shell:
	docker run -t -i cypari2_test /bin/bash 

run_python:
	docker run -t -i cypari2_test /opt/conda/bin/ipython

run_python_init:
	docker run -t -i cypari2_test /opt/conda/bin/ipython -i -c 'import pari_examples.pari as pari; pari.pari_test()'

