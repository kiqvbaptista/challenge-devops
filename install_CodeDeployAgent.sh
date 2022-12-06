#!/bin/bash
sudo apt update -y
sudo apt install -y ruby-full wget
cd /home/ubuntu
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install 
chmod +x ./install
sudo ./install auto > /tpm/logfile