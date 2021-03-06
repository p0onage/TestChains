#!/bin/bash

sudo apt-get update
sudo apt-get install -y build-essential libssl-dev git curl

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
tar -xf go1.7.linux-amd64.tar.gz
sudo cp -r go/ /usr/local/
rm -rf go/ go1.7.linux-amd64.tar.gz
export GOROOT=/usr/local/go
export GOPATH=$HOME/projects/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo "PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install -y ethereum
sudo mv /usr/bin/geth /usr/bin/normalGeth

git clone https://github.com/jpmorganchase/quorum.git
cd quorum/
git checkout 0905eda48eb07a4ce0e7072c1a2ecbf690ddff77
make all
echo "PATH=\$PATH:"$PWD/build/bin >> ~/.bashrc
source ~/.bashrc
export PATH=$PWD/build/bin:$PATH

cd ..
mkdir -p constellation && cd constellation/
sudo apt-get install -y unzip libdb-dev libleveldb-dev libsodium-dev zlib1g-dev libtinfo-dev
wget https://github.com/jpmorganchase/constellation/releases/download/v0.1.0/constellation-0.1.0-ubuntu1604.tar.xz -O constellation-0.1.0-ubuntu1604.tar.xz
tar -xf constellation-0.1.0-ubuntu1604.tar.xz
chmod +x constellation-0.1.0-ubuntu1604/constellation-node
echo "PATH=\$PATH:"$PWD/constellation-0.1.0-ubuntu1604 >> ~/.bashrc
source ~/.bashrc
export PATH=$PWD/constellation-0.1.0-ubuntu1604:$PATH

cd ..
git clone https://github.com/consensys/QuorumNetworkManager.git
cd QuorumNetworkManager/
git checkout e53b5f19504a9884aa3e344be2d2a1c98d2f10d2
npm install
