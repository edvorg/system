{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdeApplications.spectacle
    kdeApplications.ksystemlog
    plasma-nm
  ];

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
}
