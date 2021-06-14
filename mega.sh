#!/bin/bash

clear

wget https://dl.google.com/go/go1.15.6.linux-amd64.tar.gz

sudo tar -xvf go1.15.6.linux-amd64.tar.gz

sudo mv go /usr/local

sleep 5

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

source ~/.profile


echo "Go Installation Done!!!"

echo "Waiting for other tools... ..."

sleep 5



GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder

GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx

GO111MODULE=on go get -u -v github.com/lc/gau

go get -u github.com/tomnomnom/assetfinder


echo 'export GOROOT=/usr/local/go' >> ~/.bashrc

echo 'export GOPATH=$HOME/go' >> ~/.bashrc

echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc

echo 'source ~/.profile' >> ~/.bashrc



echo "[+]Huraay! Tools successfully installed"




echo "Please enter your target domain in [example.com] format"


read TARGET

echo "[+] Finding subdomains using subfinder"

sleep 3

subfinder -d $TARGET -silent | httpx -silent | tee subdomains_found.txt


echo "[+] Finding subdomains using assetfinder"

sleep 3

assetfinder --subs-only $TARGET | httpx -silent | tee -a subdomains_found.txt


echo "[+] Finding subdomains using crtsh"

sleep 3

curl -sk "https://crt.sh/?q=$TARGET" | grep -oE "[a-zA-Z0-9._-]+\.$TARGET" | sed -e '/[A-Z]/d' -e '/*/d' | grep -oP '[a-z0-9]+\.[a-z]+\.[a-z]+' | httpx -silent | tee -a subdomains_found.txt

sleep 3

cat subdomains_found.txt | sort -u | tee final_subs.txt

echo "[+] Job completed successfully!!!"


echo "INSTALLING DIRSEARCH"

sudo apt-get update
sudo apt-get install python3.6
sudo apt-get install python3.7
sudo apt-get install python3-pip

git clone https://github.com/maurosoria/dirsearch.git
