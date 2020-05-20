{ config, pkgs, ... }:

{
  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/disk/by-uuid/19172592-5cd2-4284-a3d3-0aa04f40d076";
      preLVM = true;
      allowDiscards = true;
    };
  };

  networking.hostName = "edvorg-office-desktop-nixos"; # Define your hostname.

  services.xserver.videoDrivers = [  ];

  hardware.opengl.driSupport32Bit = true;
}
