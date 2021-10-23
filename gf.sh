#!/bin/bash

echo "Installation of gf is in process..."

sleep 3

go get -u github.com/tomnomnom/gf

sleep 2

cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf

sleep 2

git clone https://github.com/1ndianl33t/Gf-Patterns

sleep 2

mv ~/Gf-Patterns/*.json ~/.gf

echo "Finshing up"

sleep 3

gf -list
