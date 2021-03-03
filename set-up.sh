#!/bin/bash

# For Ubuntu OS only at the moment - TODO add other OS support

echo "Installing docker compose..."
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get update -y
sudo apt-get install apt-transport-https ca-certificates curl gnupg -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo groupadd docker
sudo usermod -aG docker $USER
echo "Done installing docker compose"
echo "========================="
echo " "
echo "Creating Workspace folders..."
mkdir ~/Code
echo "Done setting up Workspace folders"
echo "========================="
echo " "
echo "Generate new GitHub SSH Key..."
ssh-keygen -t ed25519 -C "cloud9"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "Done generating GitHub SSH Key"
echo "========================="
echo " "
echo "******* OUTPUT *******"
echo "** SSH Key to add to GitHub **"
cat ~/.ssh/id_ed25519.pub
echo "***********************"