{ config, pkgs, ... }:

{
  services.udev.packages = [ pkgs.yubikey-personalization ];
  services.pcscd.enable = true;
  programs.ssh.startAgent = false;
  programs.ssh.askPassword = "/run/current-system/sw/bin/ksshaskpass";
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  environment.shellInit = ''
    export GPG_TTY="$(tty)"
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';

  environment.systemPackages = with pkgs; [
    gnupg
    ksshaskpass
    pass
    srm
    pinentry_qt5
  ];
}
