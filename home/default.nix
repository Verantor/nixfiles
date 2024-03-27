{ config
, pkgs
, inputs
, lib
, ...
}: {
  imports = [
    # inputs.hyprlock.homeManagerModules.default
    #inputs.hypridle.homeManagerModules.default
    ./misc
    ./desktop
    ./cli
    ./packages.nix
  ];
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.username = "ver";

  #TODO find out why lib.mkForce is needed
  home.homeDirectory = lib.mkForce "/home/ver";

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
  ];

  home.file = { };
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
