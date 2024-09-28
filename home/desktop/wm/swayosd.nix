{ lib
, config
, ...
}: {
  config = {
    services.swayosd = lib.mkIf config.sys.hyprland.enable {
      enable = true;
    };
  };
}
