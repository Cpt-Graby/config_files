#! /bin/bash

echo '--------------------'
echo ' REMOVE old packet: STARTING'
echo '--------------------'
# Checking if packages exist
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
echo '--------------------'
echo ' REMOVE old packet: END'
echo '--------------------'

echo '--------------------'
echo ' Add docker's official GPG key : STARTING
echo '--------------------'

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo '--------------------'
echo ' Add docker's official GPG key : DONE
echo '--------------------'

echo '--------------------'
echo ' Add the repository to Apt sources : STARTING'
echo '--------------------'

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo '--------------------'
echo ' Add the repository to Apt sources : DONE'
echo '--------------------'

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
