#! /usr/bin/env bash

set -e

if [ -z "${1}" ] ; then echo target was not provided ; exit 1 ; fi

echo updating
sudo cp -fv ~/Projects/system/nixos/${1}-specific.nix /etc/nixos/hardware-specific.nix
sudo cp -fv ~/Projects/system/nixos/configuration.nix /etc/nixos/configuration.nix
sudo cp -fv ~/Projects/system/nixos/security.nix /etc/nixos/security.nix
sudo cp -fv ~/Projects/system/nixos/kde.nix /etc/nixos/kde.nix
sudo cp -fv ~/Projects/system/nixos/gnome.nix /etc/nixos/gnome.nix
echo done
