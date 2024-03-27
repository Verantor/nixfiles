# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config
, pkgs
, inputs
, ...
}: {
  imports = [
  ];



  # Bootloader.
 

  networking.hostName = "who"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  console.keyMap = "us";



  # Enable the X11 windowing system.
  #services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma6.enable = true;
  #services.xserver.displayManager.defaultSession = "plasma";
  #services.xserver.displayManager.sddm.wayland.enable = true;
  services.mullvad-vpn.enable = true;
  services.flatpak.enable = true;


  

  users.users.ver = {
    isNormalUser = true;
    description = "ver";
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
    shell = pkgs.fish;
    #packages = with pkgs; [
    #];
  };

  
  #services.ollama.enable = true;
  #services.ollama.acceleration = "rocm";
  # Allow unfree packages

  #programms


  #programs.fish.enable = true;


  #android
  programs.adb.enable = true;

  #virtualisation
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;

  #system


  #Games


  programs.gnupg.agent.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged
    # programs here, NOT in environment.systemPackages
  ];





  #SUNSHINE TODO: move to file


  # Open ports in the firewall.

  # Or disable the firewall altogether.


  


}
