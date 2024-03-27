{ config
, pkgs
, inputs
, lib
, ...
}: {

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


  manual.html.enable = false;
  manual.manpages.enable = false;
  manual.json.enable = false;
}
