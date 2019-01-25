  
python: build_python run_python

build_python:
	python setup.py build_ext --inplace

run_python:
	ipython -i -c 'import pari_examples.pari as pari; pari.pari_test()'

clean:
	-rm *~
	-rm pari.cpp
	-rm pari.so
	-rm -rf build
