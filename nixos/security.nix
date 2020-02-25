{ config, pkgs, ... }:

{
  services.udev.packages = [ pkgs.yubikey-personalization ];
  services.pcscd.enable = true;
  programs.ssh.startAgent = false;
  programs.ssh.askPassword = "/run/current-system/sw/bin/ksshaskpass";
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  environment.systemPackages = with pkgs; [
    gnupg
    ksshaskpass
    pass
    srm
  ];
}
