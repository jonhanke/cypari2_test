FROM continuumio/anaconda2

## Software for Python Modules
RUN apt-get update && apt-get install -y emacs
RUN apt-get install -y gcc
RUN conda install gmpy2
RUN pip install --upgrade pip


## For Building External Software
RUN apt-get install -y g++
RUN apt-get install -y m4
RUN apt-get install -y make


## ===================================================

## Copy the files needed to build th external software only
COPY ./EXTERNAL_SOFTWARE /app/EXTERNAL_SOFTWARE

## Set the External Software Path
ENV EXTERNAL_SOFTWARE_DIR /app/EXTERNAL_SOFTWARE

## External Software Aliases 
ENV GMP_INCDIR $EXTERNAL_SOFTWARE_DIR/local/include/
ENV PARI_INCDIR $EXTERNAL_SOFTWARE_DIR/local/include/pari/
ENV GMP_CXX_LINK $EXTERNAL_SOFTWARE_DIR/local/lib/
ENV PARI_LINK $EXTERNAL_SOFTWARE_DIR/local/lib/


## Build aliases (necessary for gmpy2 to build properly)
ENV C_INCLUDE_PATH $GMP_INCDIR
ENV CPLUS_INCLUDE_PATH $GMP_INCDIR
ENV LIBRARY_PATH $GMP_CXX_LINK
ENV LD_LIBRARY_PATH $GMP_CXX_LINK


## Prioritize the EXTERNAL_SOFTWARE directory in the PATH variable
ENV PATH "$EXTERNAL_SOFTWARE_DIR/local/bin/:${PATH}"


## Set the C-Compiler path variable for use in the Pari build process
ENV CC /usr/bin/gcc


## ---------------------------------------------------


## Setup the INSTALLATION_LOGFILES folder and set the root directory to begin the installations
RUN mkdir -p $EXTERNAL_SOFTWARE_DIR/INSTALLATION_LOGFILES
WORKDIR $EXTERNAL_SOFTWARE_DIR/

## Install GMP
RUN ./Install_scripts/build_GMP.bash 2>&1 | tee -a INSTALLATION_LOGFILES/GMP_install_log.txt

## Install PARI
RUN ./Install_scripts/build_PARI.bash 2>&1 | tee -a INSTALLATION_LOGFILES/PARI_install_log.txt


## ===================================================

## Install CyPari2
#RUN pip install cysignals --upgrade 
#RUN pip install cypari2 --upgrade

#RUN pip install cypari2


## ===================================================

## Install the Python modules
COPY pari_examples /app/Python/pari_examples
ENV PYTHONPATH "${PYTHONPATH}:/app/Python/"

## Build the Python modules
WORKDIR "/app/Python/pari_examples/"
RUN python setup.py build_ext --inplace

