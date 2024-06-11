{ config
, pkgs
, inputs
, outputs
, lib
, ...
}: {
  home.packages = with pkgs; [
    networkmanagerapplet
    vesktop
    bottles
    firefox
    jellyfin-mpv-shim
    anki-bin
    mullvad-vpn
    blender-hip
    freecad
    libreoffice-fresh
    goverlay
    supersonic-wayland
    #adafruit-nrfutil
    utillinux
    usbutils
    xwaylandvideobridge
    lapce
    darktable
    unrar
    wireguard-tools
    halloy
    ianny
    libnotify
    obsidian
    qbittorrent-qt5
    exiftool
    digikam
    evince
    thud
    gnome-epub-thumbnailer
    gnome.totem
    libheif
    tenacity
    psst
    imhex
    overskride
    solaar
    papirus-icon-theme

    kdePackages.qttools

    spotify-player
    spotify

    helvum
    winetricks
    zathura
    nicotine-plus
    handbrake

    logseq

    zed-editor

    stable.super-slicer-beta

    gnome.gnome-software

    gnome.geary
    loupe
    qt6.qtwayland
    qt5.qtwayland
    wl-screenrec
    xdg-utils
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.lightly
    qt6Packages.qt6ct

    turtle
    gnome.nautilus-python
    gnome.nautilus-open-any-terminal
    gnome.sushi
  ];

  manual.html.enable = false;
  manual.manpages.enable = false;
  manual.json.enable = false;
}
