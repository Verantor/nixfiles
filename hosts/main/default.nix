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
    ./system-packages.nix
  ];

  virtualisation.containers.enable = true;
  chaotic.nyx.cache.enable = true;

  services.udev.extraRules = ''
    # Motherboard buggy when sleep
    ACTION=="add", SUBSYSTEM=="pci", DRIVER=="pcieport", ATTR{power/wakeup}="disabled"
    KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"

    # PS5 DualSense controller over USB hidraw
    KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", MODE="0660", TAG+="uaccess"

    # PS5 DualSense controller over Bluetooth hidraw
    KERNEL=="hidraw*", KERNELS=="*054C:0CE6*", MODE="0660", TAG+="uaccess"
  '';

  # Uncomment to enable Plymouth boot splash if needed
  # boot.plymouth = {
  #   enable = true;
  #   themePackages = [
  #     (pkgs.catppuccin-plymouth.override {
  #       variant = "mocha";
  #     })
  #   ];
  #   theme = "catppuccin-mocha";
  #   logo = "${pkgs.nixos-icons}/share/icons/hicolor/48x48/apps/nix-snowflake-white.png";
  # };

  services.flatpak.enable = true;

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

  services.xserver.enable = true;
  # Uncomment to enable GDM display manager if needed
  # services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # Uncomment to enable Plasma 6 desktop manager if needed
  # services.xserver.desktopManager.plasma6.enable = true;

  # Uncomment to configure xdg portals if needed
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = with pkgs; [
  #     xdg-desktop-portal-gtk
  #     # pkgs.xdg-desktop-portal-hyprland
  #     # inputs.xdg-portal-hyprland.packages.${pkgs.system}.default
  #   ];
  #   config = {
  #     common.default = "*";
  #   };
  # };

  programs.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  security.pam.services.hyprlock = { };
  security.sudo.extraConfig = "Defaults pwfeedback";
  programs.dconf.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  # Emulated systems
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  security.pam.services.login.enableGnomeKeyring = true;
}
