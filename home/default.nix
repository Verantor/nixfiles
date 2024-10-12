{ inputs
, lib
, ...
}: {
  imports = [
    inputs.nix-index-database.hmModules.nix-index
    inputs.nixvim.homeManagerModules.nixvim
    inputs.hyprland.homeManagerModules.default
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    inputs.anyrun.homeManagerModules.default
    # inputs.walker.homeManagerModules.walker
    ./misc
    ./desktop
    ./cli
    ./packages.nix
    ./creative.nix
  ];
  xdg.configFile."neovide/config.toml".text =
    /*
      toml
    */
    ''
      [font]
      normal = ["JetBrainsMono Nerd Font"] # Will use the bundled Fira Code Nerd Font by default
      size = 10.0
    '';
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
      # QT_QPA_PLATFORMTHEME = lib.mkForce "qt5ct";
      # QT_STYLE_OVERRIDE = lib.mkForce "adwaita-dark";
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
