{ pkgs, ... }: {
  home.packages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.tiling-assistant
    gnomeExtensions.forge
    gnomeExtensions.valent
    gnomeExtensions.appindicator
    gnomeExtensions.gnome-40-ui-improvements
    gnomeExtensions.blur-my-shell
    valent
    #adw-gtk3
    gnome.gnome-tweaks
    gnome-extension-manager
    gnomeExtensions.pano
  ];
}
