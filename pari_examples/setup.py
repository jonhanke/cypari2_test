from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

ext = Extension('pari',
                sources=['pari.pyx'],
                include_dirs = ['/app/EXTERNAL_SOFTWARE/local/include/pari', '/usr/local/include', '.'],
                libraries = ['gmp', 'gmpxx', 'pari'],
                library_dirs = ['/app/EXTERNAL_SOFTWARE/local/lib', '/usr/local/lib'],
                language='c++')

setup(
    ext_modules = cythonize([ext])
)

