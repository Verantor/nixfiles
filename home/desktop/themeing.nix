{ pkgs
, config
, theme
, ...
}: {
  qt.enable = true;

  # platform theme "gtk" or "gnome"
  qt.platformTheme.name = "gtk";

  # name of the qt theme
  qt.style.name = "adwaita-dark";

  # detected automatically:
  # adwaita, adwaita-dark, adwaita-highcontrast,
  # adwaita-highcontrastinverse, breeze,
  # bb10bright, bb10dark, cde, cleanlooks,
  # gtk2, motif, plastique

  # package to use
  qt.style.package = pkgs.adwaita-qt;

  # gtk.enable = true;
  #
  # gtk.cursorTheme.package = pkgs.bibata-cursors;
  # gtk.cursorTheme.name = "Bibata-Modern-Ice";
  #
  # gtk.theme.package = pkgs.adw-gtk3;
  # gtk.theme.name = "adw-gtk3-dark";
  #
  # gtk.iconTheme.package = pkgs.papirus-icon-theme;
  # gtk.iconTheme.name = "Papirus-Dark";
  # #
  # gtk.gtk3.bookmarks =
  #   let
  #     home = config.home.homeDirectory;
  #   in
  #   [
  #     "file://${home}/Documents"
  #     "file://${home}/Music"
  #     "file://${home}/Pictures"
  #     "file://${home}/Videos"
  #     "file://${home}/Downloads"
  #     "file://${home}/Desktop"
  #     "file://${home}/Work"
  #     "file://${home}/Projects"
  #     "file://${home}/Vault"
  #     "file://${home}/School"
  #     "file://${home}/.dotfiles Config"

  home.pointerCursor = {
    # gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 32;
  };
}
