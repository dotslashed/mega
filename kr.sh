#!/bin/bash


sleep 3
echo "Installing..."

wget "https://github.com/assetnote/kiterunner/releases/download/v1.0.2/kiterunner_1.0.2_linux_amd64.tar.gz"


tar -xvzf kiterunner_1.0.2_linux_amd64

sudo mv kr /usr/local/bin


echo "Installation Complete!"
