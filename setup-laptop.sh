#!/bin/bash

# Update and upgrade
sudo apt update && sudo apt upgrade -y

# Install Google Chrome
sudo apt install -y vim curl gimp vlc redis-server redis-tools xclip git
#curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo apt install ./google-chrome-stable_current_amd64.deb

# Install Visual Studio Code
sudo snap install --classic code

# Install OpenJDK 

if [ ! -d "/usr/lib/jvm/jdk-21.0.2"]; then
  curl -LO https://download.java.net/java/GA/jdk21.0.2/f2283984656d49d69e91c558476027ac/13/GPL/openjdk-21.0.2_linux-x64_bin.tar.gz
  tar -xzvf openjdk-21.0.2_linux-x64_bin.tar.gz
  sudo mv jdk-21.0.2 /usr/lib/jvm
  export JAVA_HOME=/usr/lib/jvm/jdk-21.0.2/
  export PATH=$JAVA_HOME/bin:$PATH
  source ~/.bashrc
fi

sudo snap install gradle --classic
sudo snap install android-studio --classic

# Install Node.js and NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install node

# Install discord
sudo snap install discord

gsettings set org.gnome.shell favorite-apps "$(cat favorite-apps.txt)"


#/home/$USER/dotfiles/config/setup.sh
