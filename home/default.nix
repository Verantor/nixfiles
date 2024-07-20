{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nix-index-database.hmModules.nix-index
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ./misc
    ./desktop
    ./cli
    ./packages.nix
  ];
  home = {
    stateVersion = "23.11"; # Please read the comment before changing.
    username = "ver";

    #TODO find out why lib.mkForce is needed
    homeDirectory = lib.mkForce "/home/ver";
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "foot";
      NIXOS_OZONE_WL = "1"; #TODO spotify doesn't work with this i think
      GDK_BACKEND = "wayland,x11,*";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_QPA_PLATFORMTHEME = lib.mkForce "qt5ct";
      QT_STYLE_OVERRIDE = lib.mkForce "adwaita-dark";
      #SDL_VIDEODRIVER = "wayland"; #TODO Remove or set to x11 if games that provide older versions of SDL cause compatibility issues
      CLUTTER_BACKEND = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      #WLR_NO_HARDWARE_CURSORS = "1";
    };
  };

  # services.kdeconnect = {
  #   enable = true;
  #   package = pkgs.kdePackages.kdeconnect-kde;
  # };
  manual = {
    # home.file = { };
    html.enable = false;
    manpages.enable = false;
    json.enable = false;
  };
  programs.home-manager.enable = true;
}
