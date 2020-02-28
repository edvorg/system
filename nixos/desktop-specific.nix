{ config, pkgs, ... }:

{
  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/disk/by-uuid/1dd1f5b9-d88e-4747-9268-26a000305ea7";
      preLVM = true;
      allowDiscards = true;
    }
  ];

  networking.hostName = "edvorg-desktop-nixos"; # Define your hostname.

  services.xserver.videoDrivers = [ "intel" "nvidia" ];

  hardware.opengl.driSupport32Bit = true;
  virtualisation.docker.enableNvidia = true;
}
