#!/bin/bash
# Pacman dependencies
sudo pacman -S qemu-full virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat libvirt edk2-ovmf

# Enable services
sudo systemctl enable --now libvirtd
sudo systemctl enable --now virtlogd

# Add user to group
sudo usermod -aG libvirt $(whoami)

echo "You need to soft-reboot for vm to work!!"
