{ config, pkgs, ... }:

{
  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
}
