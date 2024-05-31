{ pkgs
, ...
}: {


  home.packages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.tiling-assistant
    gnomeExtensions.forge
    gnomeExtensions.valent
    gnomeExtensions.appindicator
    gnomeExtensions.gnome-40-ui-improvements
    stable.gnomeExtensions.blur-my-shell
    stable.valent
    #adw-gtk3
    gnome.gnome-tweaks
  ];


}
