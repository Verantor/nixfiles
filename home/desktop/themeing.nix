{ pkgs
, config
, lib
, ...
}: {
  home.packages = with pkgs; [
    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
  ];
  qt = {
    enable = true;

    # platform theme "gtk" or "gnome"
    platformTheme.name = lib.mkForce "qtct";

    # name of the qt theme
    style.name = lib.mkForce "adwaita-dark";

    # package to use
    style.package = w lib.mkForce with pkgs;
    [adwaita-qt adwaita-qt6];
    };
    gtk = {
      enable = true;

      # gtk.cursorTheme.package = pkgs.bibata-cursors;
      # gtk.cursorTheme.name = "Bibata-Modern-Ice";

      # gtk.theme.package = pkgs.adw-gtk3;
      # gtk.theme.name = "adw-gtk3-dark";

      iconTheme.package = pkgs.papirus-icon-theme;
      iconTheme.name = "Papirus-Dark";
      #
      gtk3.bookmarks =
        let
          home = config.home.homeDirectory;
        in
        [
          "file://${home}/Games"
          "file://${home}/Documents"
          "file://${home}/Music"
          "file://${home}/Pictures"
          "file://${home}/Videos"
          "file://${home}/Downloads"
          "file://${home}/Desktop"
          "file://${home}/Work"
          "file://${home}/Projects"
          "file://${home}/Vault"
          "file://${home}/School"
          "file://${home}/.dotfiles Config"
        ];
    };
    # home.pointerCursor = {
    #   gtk.enable = true;
    #   x11.enable = true;
    #   package = pkgs.bibata-cursors;
    #   name = "Bibata-Modern-Ice";
    #   size = 32;
    # };
  }
