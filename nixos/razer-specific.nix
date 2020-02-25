{ config, pkgs, ... }:

{
  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/disk/by-uuid/cb026bd3-c1cf-4f9a-9897-c894d69168a4";
      preLVM = true;
      allowDiscards = true;
    }
  ];

  networking.hostName = "edvorg-razer-nixos"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    	acpi
  ];
}
