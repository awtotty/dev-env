#! For Ubuntu 16.04 or later

# This is the install script for the host machine.
# Installs are minimal to keep the host light.
# Docker images are used for more complete development environments. 

# Install vim, tmux, git
sudo apt-get install vim tmux git

# Install docker
sudo apt-get remove docker docker-engine

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

if [ $(arch)==x86_64 ] 
    then
        sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
    else
        sudo add-apt-repository \
        "deb [arch=armhf] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
fi

sudo apt-get update
sudo apt-get install docker-ce

