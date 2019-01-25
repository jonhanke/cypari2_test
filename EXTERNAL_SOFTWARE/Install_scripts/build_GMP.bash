cd $EXTERNAL_SOFTWARE_DIR

## Clear out the old build and installed files
rm -rf Builds/gmp-6.1.1


## Create a new build directory and unpack the tarball
cp Tarballs/gmp-6.1.1.tar.bz2 Builds
cd Builds
tar -jxvf gmp-6.1.1.tar.bz2
#tar --lzip -xvf gmp-5.1.2.tar
rm -f gmp-6.1.1.tar.bz2


## Configure the installation
cd gmp-6.1.1
./configure --prefix=$EXTERNAL_SOFTWARE_DIR/local/ --enable-cxx

## Build and test the installation
make
#make check

## Install the software
make install
