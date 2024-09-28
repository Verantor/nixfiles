{ config
, lib
, ...
}:
let
  inherit
    (lib)
    mkIf
    mkEnableOption
    mkPackageOption
    mkOption
    optionalString
    optionalAttrs
    isDerivation
    recursiveUpdate
    getExe
    literalExpression
    types
    maintainers
    ;

  cfg = config.sys.hyprland;
in
{
  options = {
    sys.hyprland = {
      enable = mkEnableOption "Hyprland, a Wayland compositor";
    };
  };

  imports = mkIf cfg.enable [
    ./hyprland
    ./waybar
    ./lock.nix
    ./dunst.nix
    ./wofi
    ./wlogout
    ./swayosd.nix
    ./swaync
  ];
}
