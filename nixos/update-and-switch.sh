#! /usr/bin/env bash

set -e

if [ -z "${1}" ] ; then echo target was not provided ; exit 1 ; fi
if [ ! -f "hardware-specific/${1}.nix" ] ; then echo target does not exist ; exit 1 ; fi

echo updating
sudo cp -fv ~/Projects/system/nixos/hardware-specific/${1}.nix /etc/nixos/hardware-specific.nix
sudo cp -fv ~/Projects/system/nixos/configuration.nix /etc/nixos/configuration.nix
sudo cp -fv ~/Projects/system/nixos/security.nix /etc/nixos/security.nix
sudo cp -fv ~/Projects/system/nixos/kde.nix /etc/nixos/kde.nix
echo done

echo switching
sudo nixos-rebuild switch