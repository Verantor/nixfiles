{ pkgs, ... }: {
  programs.seahorse.enable = true;
  programs = {
    adb.enable = true;
  };
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman thunar-media-tags-plugin ];
  };
  services.tumbler.enable = true; # Thumbnail support for images
  programs.nm-applet.enable = true;

  services.gnome = {
    gnome-keyring.enable = true;
  };
  programs.partition-manager.enable = true;

  programs.command-not-found.enable = false;
  programs.nix-index.enable = true;
}

