{ pkgs, ... }: {
  home.packages = with pkgs; [
    networkmanagerapplet
    vesktop
    bottles
    firefox
    # floorp
    anki-bin
    blender-hip
    freecad
    libreoffice-fresh
    goverlay
    # supersonic-wayland
    #adafruit-nrfutil
    utillinux
    usbutils
    xwaylandvideobridge
    # lapce
    darktable
    unrar
    wireguard-tools
    halloy
    # ianny
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
    # solaar
    papirus-icon-theme
    # kdePackages.qttools
    k3b
    # spotify-player
    spotify
    # reaper
    # vcv-rack
    helvum
    winetricks
    protontricks
    zathura
    nicotine-plus
    # handbrake

    # logseq

    zed-editor

    super-slicer-beta

    gnome.gnome-software

    gnome.geary
    loupe
    # qt6.qtwayland
    # qt5.qtwayland
    wl-screenrec
    xdg-utils
    # libsForQt5.qtstyleplugin-kvantum
    # libsForQt5.lightly
    # qt6Packages.qt6ct

    # turtle
    # gnome.nautilus-python
    # nautilus-open-any-terminal
    gnome.sushi
    gnome.nautilus
    papers

    gnome.dconf-editor # Edit gnome's dconf
    gnome.eog

    handbrake

    goldwarden

    mixxx

    r2modman

    easyeffects
    prismlauncher
  ];
}
