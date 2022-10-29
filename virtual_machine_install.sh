#!/bin/bash
#Script to automate creating VMs via virt-install from command line

clear
echo "
 __     ___      _       ___           _        _ _   _                      ____            _       _
 \ \   / (_)_ __| |_    |_ _|_ __  ___| |_ __ _| | | | |    __ _ _____   _  / ___|  ___ _ __(_)_ __ | |_
  \ \ / /| | __| __|____| ||  _ \/ __| __/ _   | | | | |   / _  |_  / | | | \___ \ / __|  __| |  _ \| __|
   \ V / | | |  | ||_____| || | | \__ \ || (_| | | | | |__| (_| |/ /| |_| |  ___) | (__| |  | | |_) | |_
    \_/  |_|_|   \__|   |___|_| |_|___/\__\__,_|_|_| |_____\__,_/___|\__, | |____/ \___|_|  |_| .__/ \__|
                                                                     |___/                    |_|        "

echo "Author: Yusef Joyner"
echo "Version 1.0"
echo "GitHub: https://github.com/averagejoesautos"
echo

read -p "What do you want to name the virtual machine?: " name

clear

read -p "How much memory do you want to give to the virtual machine?: [ex 2048 is 268 MB] " memory

clear

read -p "How much disk space do you want to give to the virtual machine?: [ex 1 = 1GB] " disk

clear

read -p "How many virtual cpus do you want the virtual machine to have?: [1-4 is recommended] " vcpus

clear

read -p "What network would you like to assign the virtual machine to?: [If you have not setup another network or bridge outside of the deafaul network type 'default' to use default network] " network

clear

#Checking Directory to see if it exists
dc=0
while [ $dc -lt 1 ]
do
    read -p "Which directory is the iso file of the VM located?: " iso_dir
    if [ -d "$iso_dir" ]; then
        echo -e "here are the files in $iso_dir: \n"
        ls -alh $iso_dir
        break
    fi

    if [ ! -d "$iso_dir" ]; then
        echo "This directory does not exist.  Please try again."
    fi
done

#Getting ISO file and checking to see if file exists
fc=0
while [ $fc -lt 1 ]
do
    read -p "Which file would you like to use: " cdrom
    if [ -f "$iso_dir/$cdrom" ]; then
    echo -e "$iso_dir/$cdrom exists.\n\n"
    cdrom="$iso_dir/$cdrom"
    echo -e "File $cdrom will be used.\n"
    break
    fi

    if [ ! -f "$iso_dir/$cdrom" ]; then
    echo "This file does not exist.  Please try again."
    fi
done

clear

virt-install --osinfo list
echo -e "\n"
read -p "What version of unix or windows is the virtual machine: " os_variant

clear

#VM Parameter confirmation
echo "You have selected the following parameters for your VM:"
echo
echo -e "\n VM name: $name \n Disk Size: $disk \n Virtual CPU's: $vcpus \n ISO file location: $cdrom \n OS archetecture: $os_variant \n Network: $network\n"

read -p "Does this information look correct?: y/n " confirmation1
if [ "$confirmation1" = "y" ] || [ "$confirmation1" = "Y" ]
then
####Create VM########

    virt-install --name $name --memory $memory --vcpus $vcpus --disk size=$disk --cdrom $cdrom --os-variant $os_variant --network "network=$network" --graphics vnc,listen=0.0.0.0 --noautoconsole

    echo

    echo -e "\n\n**IMPORTANT** The installation of the VM is not complete yet.  You need to VNC to the VM to finalize the install.   Please locate your IP address [i.e. 192.168.1.24] and use this IP address to VNC into the VM using your VNC programe of choice.  In your VNC program you will connect to screen :0 [i.e 192.168.1.24:0]\n"

else
    echo "Try again. Progam exiting"
    exit
fi

