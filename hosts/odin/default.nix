# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./hardware
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Virtualization
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "odin"; 
  networking.firewall.enable = false;
  
  services.avahi.enable = true;
  services.avahi.nssmdns = true;# Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.wfisher = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Wes Fisher";
    extraGroups = [ "networkmanager" "wheel" "docker" "scanner" "lp"];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
    enableSSHSupport = true;
    enableExtraSocket = true;
  };

  programs.zsh.enable = true;

  programs.git.enable = true; 

  services.tailscale.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    lshw
    sshfs
    tmux
    pinentry
    pinentry-gnome3
    evolution
    inetutils
  ];


  system.stateVersion = "23.11"; # Did you read the comment?

}
