#! /usr/bin/env bash

set -e

sudo cp -f ~/Projects/system/nixos/${1}-specific.nix /etc/nixos/hardware-specific.nix
sudo cp -f ~/Projects/system/nixos/configuration.nix /etc/nixos/configuration.nix
