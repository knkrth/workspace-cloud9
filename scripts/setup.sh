#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install ssh -y

sudo apt install python3
pip install pipenv

sudo apt install npm
sudo npm install -g serverless