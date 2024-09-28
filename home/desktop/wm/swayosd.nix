{ lib
, config
, ...
}: {
  services.swayosd = {
    enable = lib.mkIf config.sys.hyprland.enable;
  };
}
