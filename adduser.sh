#!/bin/bash -
# Author:      Christo Deale                  
# Date:        2023-06-27                
# adduser:     Utility to add username & password

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

# Prompt for the new username
read -p "Enter username: " username

# Prompt for the new password
read -s -p "Enter password: " password
echo

# Create the user with the specified username and home directory
useradd -m -s /bin/bash $username

# Set the password for the new user
echo "$username:$password" | chpasswd

# Output success message
echo "User $username has been created successfully with password set."

# Set the ownership and permissions of the user's home directory
chown -R $username:$username /home/$username
chmod 700 /home/$username
