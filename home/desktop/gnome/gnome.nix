{ pkgs
, ...
}: {


  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.tiling-assistant
    gnomeExtensions.forge
    gnomeExtensions.valent
    gnomeExtensions.appindicator
    gnomeExtensions.gnome-40-ui-improvements
    valent
    adw-gtk3
    gnome.gnome-tweaks
  ];


}
