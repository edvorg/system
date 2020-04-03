# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./security.nix
      ./hardware-configuration.nix
      ./hardware-specific.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.enableCryptodisk = true;
  boot.loader.grub.configurationLimit = 2;
  boot.extraModprobeConfig = "options kvm_intel nested=1";

  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  networking.networkmanager.enable = true;

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Asia/Hong_Kong";

  fonts.enableFontDir = true;
  fonts.fontconfig.enable = true;
  fonts.fonts = [ pkgs.nerdfonts ];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # basic system tools
    p7zip
    gwenview
    unzip
    plasma-nm
    firefox-devedition-bin
    chromium
    thunderbird-bin
    git
    git-lfs
    wget
    vim
    emacs
    tmux
    kdeApplications.spectacle
    gparted
    ntfs3g
    usbutils
    lsd
    bat
    traceroute
    kdeApplications.ksystemlog
    gwenview
    ark
    filelight
    alacritty
    python38
    zoom-us
    inetutils
    bind
    # virtualization
    vagrant
    docker-compose
    docker
    qemu
    virtmanager-qt
    dmg2img
    libguestfs-with-appliance
    # multimedia
    amarok
    vlc
    obs-studio
    gimp
    blender
    audacity
    calibre
    sidequest
    transmission-gtk
    # android development
    android-udev-rules
  ];
  programs.adb.enable = true;
  programs.java.enable = false;
  environment.shellAliases = {
    ll = "lsd -l";
    ls = "lsd";
    cat = "bat";
  };

  # List services that you want to enable:

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  users.extraGroups.vboxusers.members = [ "edvorg" ];
  users.users.edvorg = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "libvirtd"
      "adbusers"
      "plugdev"
      "audio"
      "video"
      "input"
    ];
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}
