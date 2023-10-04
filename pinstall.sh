#!/bin/bash

clear

# Function for colored output
yellow_msg() {
    echo -e "\e[93m$1\e[0m"
}

blue_msg() {
    echo -e "\e[94m$1\e[0m"
}


sleep 0.5

echo 
yellow_msg 'Updating the System.'
echo 

sleep 0.5

sudo apt update
sudo apt -y upgrade
sudo apt -y dist-upgrade
sudo apt -y autoremove
sleep 0.5
    
# Again :D
sudo apt -y autoclean
sudo apt -y clean
sudo apt update
sudo apt -y upgrade
sudo apt -y dist-upgrade
sudo apt -y autoremove

echo "Installing essential Python packages and tools..."

# Check if Python is installed
if command -v python3 &>/dev/null; then
    echo "Python is already installed. Proceeding with package installation."
else
    echo "Python is not installed. Please install Python and run this script again."
    exit 1
fi

# Install pip (if not installed)
if command -v pip &>/dev/null; then
    echo "pip is already installed."
else
    echo "Installing pip..."
    sudo apt-get update
    sudo apt-get install python3-pip
fi

# Install common Python packages
pip install virtualenv django numpy requests

# Install Telegram bot library
pip install python-telegram-bot

# Check if pip is installed and install a cool package for testing
if command -v pip &>/dev/null; then
    yellow_msg "Installing a cool package for testing..."
    pip install cowsay
    echo "Testing the cool package..."
    cowsay -t "This is a test message with cowsay!"
else
    yellow_msg "pip is not installed. Skipping the cool package installation."
fi

yellow_msg "Installation complete. Enjoy coding with Django and other essential Python packages!"
echo
blue_msg "All Done!"
echo
