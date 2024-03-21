#!/bin/bash
while true; do
    echo "Press 1 for install"
    echo "Press 2 for delete"
    echo "Press 3 for update"
    echo "Press 4 for help"
    echo "Press 5 to exit"
    
    read -p "Enter your choice: " choice

    if [ "$choice" == "1" ]; then
        echo "Install option selected"
       echo  "the python3 installation start now "; sudo apt-get update && sudo apt install python3
      read -p "enter the file name in which python code is written make sure with .py extansion=" python
      echo "the file is created in the /use/bin directory"; touch /usr/bin/$python
    #read -p "privde a name of file " name
echo -e "the file is created "; cd
# Specify the file path of the existing script
existing_script="/usr/bin/$python"

# Append the new functionality to the existing script file
 cat >> "$existing_script" << 'EOF'
 #!/usr/bin/env python3

import time

while True:
    print("hy ahsan")
    time.sleep(10)  # Sleep for 10 seconds before printing again

EOF

echo "New functionality added to $existing_script" 
      echo "apke python file ma code a gya ha"; 
      echo "this is part is go for serviced section"
      echo "then it is for come hoom directory";cd
      sudo chmod +x /usr/bin/$python 
      read -p "give a service name =" service
     
      echo "make the service is this path"; touch /etc/systemd/system/$service
      echo -e "the file is created "; cd
# Specify the file path of the existing script
existing_script="/etc/systemd/system/$service"

# Append the new functionality to the existing script file
 cat >> "$existing_script" << 'EOF'
[Unit]
Description=py service
Documentation=https://bugx.academy
After=network.target

[Service]
Type=simple
ExecStart=/bin/python3 /usr/bin/echo "$python"
Restart=on-failure
RestartSec=60

[Install]
WantedBy=multi-user.target


EOF

echo "New functionality added to $existing_script" 
sudo systemctl start $service

sudo systemctl status $service


echo "service is runing"
echo "service is runing"
    elif [ "$choice" == "2" ]; then
        echo "Delete systemd service "
#        echo "sub sy phala hum us path ma jya ga jaga service hoti hain"; cd /etc/systemd/system
       # ls
        directory="/etc/systemd/system"

# Count the number of .service files in the specified directory
count=$(find "$directory" -type f -name "*.service" | grep -c ".service")

echo "Number of .service files in $directory: $count"
echo "List of .service files in $directory:"
ls "$directory"/*.service 
read -p "enter the name of servive u want to remove =" RM
#echo "phr hun us dir ma a jy agya"; cd /etc/systemd/system
sudo systemctl stop $RM
sudo systemctl disable $RM
sudo rm /etc/systemd/system/$RM
echo "the service file is deleted"

echo "now delet the scrpy "
read -p "enter the script name " name 
echo "delete the script "; sudo rm -f /usr/bin/echo "$name"
       
    elif [ "$choice" == "3" ]; then
        echo "Update option selected"
        echo "this is only word with .py file the are already created "
        directory="/usr/bin/"

# List all .py files in the specified directory
find "$directory" -type f -name "*.py"
read -p "enter the name of the file u want to update" update
echo "the file is open know u can update it"; sudo nano /usr/bin/$update
read -p "enter the service name " Sn
sudo systemctl daemon-reload
sudo systemctl restart  $Sn
sudo systemctl status $Sn


    elif [ "$choice" == "4" ]; then
        echo "Help option selected"
        echo "In this script hum systemd ke servicr customise banaty hain is ma python ka  ek helo work ka code para hoa ha or path wgara be hr chaz set hain. "
    elif [ "$choice" == "5" ]; then
        exit
    else
        echo "Invalid option"
    fi

done
#
