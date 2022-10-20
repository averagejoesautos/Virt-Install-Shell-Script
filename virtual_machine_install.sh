#!/bin/bash
#Script to automate creating VMs via virt-install from command line

read -p "What do you want to name the virtual machine?: " name

read -p "How much memory do you want to give to the virtual machine?: [ex 2048 is 268 MB] " memory

read -p "How much disk space do you want to give to the virtual machine?: [ex 1 = 1GB] " disk

read -p "How many virtual cpus do you want the virtual machine to have?: [1-16 or select 'auto'] " vcpus

network="vm-br0"

#Checking Directory to see if it exists
dc=0
while [ $dc -lt 1 ]
do
    read -p "Which directory is the iso file stored in?: " iso_dir
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

virt-install --osinfo list
echo -e "\n"
read -p "What version of unix or windows is the virtual machine: " os_variant

#VM Parameter confirmation
echo -e "\n VM name: $name \n Disk Size: $disk \n Virtual CPU's: $vcpus \n ISO file location: $cdrom \n OS archetecture: $os_variant \n Network: $network\n"

read -p "Does this information look correct?: y/n " confirmation1
if [ "$confirmation1" = "y" ] || [ "$confirmation1" = "Y" ]
then
####Create VM########

    virt-install --name $name --memory $memory --vcpus $vcpus --disk size=$disk --cdrom $cdrom --os-variant $os_variant --network "network=$network" --graphics vnc,listen=0.0.0.0 --noautoconsole

    echo -e "\n\nIn order to connect to the VM to complete install, please locate your IP address and use that IP address to VNC into the VM using screen :0\n"

else
    echo "Try again. Progam exiting"
    exit
fi

