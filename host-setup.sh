#! For Ubuntu 16.04 or later

# This is the install script for the host machine.
# Installs are minimal to keep the host light.
# Docker images are used for more complete development environments. 

# Install vim, tmux, git, mosh
sudo apt-get install vim tmux git mosh

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

# Add executable status to scripts
chmod +x $(dirname $0)/start-env.sh
chmod +x $(dirname $0)/docker-cleaner.sh

# Pull dotfiles and add .vimrc to host
git clone https://github.com/awtotty/dotfiles
mv dotfiles/.vimrc ~/.vimrc
rm -r dotfiles
