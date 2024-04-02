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
    freecad

    goverlay


    xwaylandvideobridge
    lapce

    libnotify
    obsidian
    qbittorrent-qt5

    evince
    thud
    gnome-epub-thumbnailer
    gnome.totem
    libheif


papirus-icon-theme

  ];


  manual.html.enable = false;
  manual.manpages.enable = false;
  manual.json.enable = false;
}
