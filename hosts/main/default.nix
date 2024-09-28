{ pkgs
, inputs
, config
, ...
}:
let
  # Uncomment to include the maccelModule if needed
  # maccelModule = config.boot.kernelPackages.callPackage ./maccelModule.nix { };
in
{
  # Uncomment to include maccelModule in extra module packages if needed
  # boot.extraModulePackages = [ maccelModule ];

  imports = [
    ./hardware-configuration.nix
    ./regreet.nix
    ./programs.nix
    ./services.nix
    ./users.nix
    ./fonts.nix
    ./packages.nix
    ./flatpak.nix
    ./vr.nix
    ./gnome.nix
  ];
  networking.nameservers = [ "192.168.178.190" "1.1.1.1" "9.9.9.9" ];
  virtualisation.containers.enable = true;

  services.udev.extraRules = ''
    # Motherboard buggy when sleep
    ACTION=="add", SUBSYSTEM=="pci", DRIVER=="pcieport", ATTR{power/wakeup}="disabled"
    KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"

    # PS5 DualSense controller over USB hidraw
    KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", MODE="0660", TAG+="uaccess"

    # PS5 DualSense controller over Bluetooth hidraw
    KERNEL=="hidraw*", KERNELS=="*054C:0CE6*", MODE="0660", TAG+="uaccess"
  '';

  services.flatpak.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  # Uncomment to add extra Nix options if needed
  # nix = {
  #   extraOptions = ''
  #     !include ${config.sops.secrets.githubAccesstoken.path}
  #   '';
  #   sops.secrets.githubAccesstoken = {
  #     mode = "0440";
  #     group = config.users.groups.keys.name;
  #   };
  # };

  environment.pathsToLink = [ "share/thumbnailers" ];

  # Uncomment to enable Plasma 6 desktop manager if needed
  # services.xserver.desktopManager.plasma6.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      # xdg-desktop-portal-gtk
      # xdg-desktop-portal-hyprland
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland
    ];
  };

  programs.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    # portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  security.pam.services.hyprlock = { };
  security.sudo.extraConfig = "Defaults pwfeedback";
  programs.dconf.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Emulated systems
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  security.pam.services.login.enableGnomeKeyring = true;
}
