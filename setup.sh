#!/bin/dash

cd ~/qemu-setup

find . -maxdepth 1 -mindepth 1 -exec mv -f {} ~ \;

cd

packages="qemu-full virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat libguestfs"

for package in $packages; do
  paru -S --noconfirm "$package"
done

sudo systemctl start libvirtd

sudo systemctl enable libvirtd

sudo mv libvirtd.conf /etc/libvirt/libvirtd.conf

sudo usermod -aG libvirt $USER

sudo systemctl restart libvirtd

rm -rf .git

rm -r qemu-setup

rm LICENSE

rm README.md

rm setup.sh

echo finished, reboot your computer
