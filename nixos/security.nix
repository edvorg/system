{ config, pkgs, ... }:

{
  services.udev.packages = [ pkgs.yubikey-personalization ];
  services.pcscd.enable = true;
  services.sshd.enable = false;
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
    (pass.withExtensions (ext: with ext; [pass-import]))
    srm
    pinentry_qt5
    yubikey-manager
    yubikey-manager-qt
  ];

  networking.firewall.allowedTCPPorts = [];
  networking.firewall.allowedUDPPorts = [];
}
