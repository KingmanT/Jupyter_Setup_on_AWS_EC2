#!/bin/bash

#script must be run as a root user
#conditional to check for root user
if [ $UID != 0 ]; then
  echo "Please run this script as root user"
  exit 1
fi
echo " "
echo " "
echo "This script will install Jupyter Lab onto this machine"
echo " "
echo "Enter 'exit' to cancel process or press enter to continue"
echo "----------------------------------------------------------"
read ans1

if [[ $ans1 = "exit" ]]; then
  echo " "
  echo "Exiting command"
  echo " "
  exit 0

elif [[ -z  $ans1 ]]; then
  echo "----------"
  echo "Continuing installation"
  echo " "
  sleep 2
  echo "Preparing to update server.."
  echo "----------"
  sleep 2

else
  echo " "
  echo "Invalid response. Exiting command."
  echo "----------"
  exit 1
fi

#update server
apt update
sleep 2

echo "----------"
echo "Server updated"
echo "----------"
sleep 2
echo " "
echo "Preparing to install Python package installer.."
echo " "
sleep 2

#install python3-pip
apt install -y python3-pip
sleep 2

echo "----------"
echo "Python3-pip installed"
echo "----------"
sleep 2

echo " "
echo "Preparing to install Jupyter Lab.."
echo " "
sleep 2

#install jupyter lab
pip install jupyterlab
sleep 2

echo "----------"
echo "Jupyter Lab installed"
echo "----------"
echo " "
echo "To start Jupyter Lab enter the command: 'jupyter lab --no-browser --ip=0.0.0.0'"
echo "To access notebook: open a new browser, enter the public IP address of your EC2, followed by port 8888."
echo "Exiting"
echo "----------"

exit 0
fi
