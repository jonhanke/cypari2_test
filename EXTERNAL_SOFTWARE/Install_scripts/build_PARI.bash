cd $EXTERNAL_SOFTWARE_DIR

## Clear out the old build
rm -rf Builds/pari-2.11.1

## Create a new build directory and unpack the tarball
cp Tarballs/pari-2.11.1.tar.gz Builds
cd Builds
tar -zxvf pari-2.11.1.tar.gz
rm -f pari-2.11.1.tar.gz

## Configure the installation
cd pari-2.11.1
./Configure --prefix=$EXTERNAL_SOFTWARE_DIR/local

## Build and test the installation
make all
#make bench

## Install the software
make install
