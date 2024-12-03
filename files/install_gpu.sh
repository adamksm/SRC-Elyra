#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update

sudo apt-get install -y nvidia-driver-470

echo "Rebooting to load nvid driver"
sudo reboot
