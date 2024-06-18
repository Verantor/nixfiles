{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    #inputs.hyprlock.homeManagerModules.default
    #inputs.hypridle.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nix-index-database.hmModules.nix-index
    ./misc
    ./desktop
    ./cli
    ./packages.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.stable-packages
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.username = "ver";

  services.kdeconnect = {
    enable = true;
    package = pkgs.kdePackages.kdeconnect-kde;
  };

  #TODO find out why lib.mkForce is needed
  home.homeDirectory = lib.mkForce "/home/ver";

  home.packages = with pkgs; [
  ];

  home.file = { };
  manual.html.enable = false;
  manual.manpages.enable = false;
  manual.json.enable = false;

  #
  home.sessionVariables = { };

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "floorp";
    TERMINAL = "foot";
    NIXOS_OZONE_WL = "1"; #TODO spotify doesn't work with this i think
    GDK_BACKEND = "wayland,x11,*";
    QT_QPA_PLATFORM = "wayland;xcb";
    #SDL_VIDEODRIVER = "wayland"; #TODO Remove or set to x11 if games that provide older versions of SDL cause compatibility issues
    CLUTTER_BACKEND = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    #WLR_NO_HARDWARE_CURSORS = "1";
  };
  programs.home-manager.enable = true;
}
