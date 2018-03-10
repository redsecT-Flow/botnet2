#! /bin/bash

# Get IP address of host machine
IP=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')

# Update the OS
echo "Updating package repositories..."
sleep 1
echo ""
echo ""
apt-get update
echo ""

# Install prerequisite packages
echo "Installing prerequisite packages..."
sleep 1
echo ""
echo ""
apt-get install python2.7 python-pip sqlite3 git -y
echo ""

# Install Python CherryPy Framework
echo "Installing CherryPy framework..."
sleep 1
echo ""
echo ""
pip install --upgrade pip
pip install cherrypy
echo ""

# Create & initialize the database
echo "Initializing database..."
sleep 1
echo ""
echo ""
cd ~/460SP/Ares/server && python2.7 db_init.py
echo "Database created!"
echo ""

# Start the server and open web interface
#echo "C&C server started at $IP:8080!"
sleep 1
python2.7 server.py
firefox 0.0.0.0:8080
