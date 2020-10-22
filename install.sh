#!/bin/bash
#Download packages
rm -rf bin && mkdir -p bin && cd bin
#wget https://repo.anaconda.com/archive/Anaconda2-2019.10-Linux-x86_64.sh 

#Auto-install Anaconda2
#chmod +x Anaconda2-2019.10-Linux-x86_64.sh
#./Anaconda2-2019.10-Linux-x86_64.sh -b -p $HOME/anaconda2

#Partition Finder
wget https://github.com/brettc/partitionfinder/archive/v2.1.1.tar.gz && mv v2* partitionfinder-2.1.1.tar.gz
tar -zxf partitionfinder-2.1.1.tar.gz

#Beast and Beagle
sudo apt-get -y install build-essential autoconf automake libtool git pkg-config
git clone https://github.com/beagle-dev/beagle-lib.git 
cd beagle-lib/ && ./autogen.sh && ./configure --prefix=$HOME && make install
cd ../
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/beast-mcmc/BEASTv1.7.5.tgz
tar -zxf BEASTv1.7.5.tgz
cd BEASTv1.7.5/lib && ln -s ~/lib/* .
cd ../../../

