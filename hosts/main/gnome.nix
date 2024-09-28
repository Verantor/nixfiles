{ config
, lib
, ...
}: {
  services.xserver.enable = true;
  # Uncomment to enable GDM display manager if needed
  # services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = lib.mkIf config.sys.gnome.enable true;
}
