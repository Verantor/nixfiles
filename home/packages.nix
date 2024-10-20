{ pkgs, ... }: {
  ### Insert Point
  home.packages = with pkgs; [
    networkmanagerapplet
    vesktop
    bottles
    # firefox
    # floorp
    anki-bin

    libreoffice-fresh
    goverlay
    # supersonic-wayland
    #adafruit-nrfutil
    utillinux
    usbutils
    xwaylandvideobridge
    # lapce

    unrar
    wireguard-tools
    halloy
    # ianny
    libnotify
    obsidian
    qbittorrent
    exiftool

    evince
    thud
    gnome-epub-thumbnailer
    totem
    libheif
    tenacity
    psst
    imhex
    overskride
    # solaar
    papirus-icon-theme
    # kdePackages.qttools
    k3b
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

    gnome-software

    geary
    loupe
    # qt6.qtwayland
    # qt5.qtwayland
    wl-screenrec
    xdg-utils
    # libsForQt5.qtstyleplugin-kvantum
    # libsForQt5.lightly
    # qt6Packages.qt6ct

    # turtle
    # nautilus-python
    # nautilus-open-any-terminal
    sushi
    nautilus
    papers

    dconf-editor # Edit gnome's dconf
    eog

    handbrake

    goldwarden

    mixxx

    r2modman

    easyeffects
    prismlauncher

    ladybird
    # stable.kicad
    rpi-imager

    rquickshare
    oculante
    neovide
  ];
}
