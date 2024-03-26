{ config
, pkgs
, inputs
, ...
}: {
  imports = [
    inputs.hyprlock.homeManagerModules.default
    inputs.hypridle.homeManagerModules.default
    ./misc
    ./desktop
    ./cli
  ];
  home.username = "ver";
  home.homeDirectory = "/home/ver";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    vesktop
    bottles
    firefox
    
    anki-bin
    mullvad-vpn
    blender-hip


    goverlay

  
    xwaylandvideobridge
    lapce

    libnotify
    obsidian
    qbittorrent-qt5



    #colmap insecure
  ];

  home.file = {

  };
  manual.html.enable = false;
  manual.manpages.enable = false;
  manual.json.enable = false;

  #
  home.sessionVariables = {
    EDITOR = "hx";
    NIXOS_OZONE_WL = "1";
  };

  programs.home-manager.enable = true;
}
