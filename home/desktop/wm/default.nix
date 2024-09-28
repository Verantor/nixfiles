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
in
{
  options = {
    sys.hyprland = {
      enable = mkEnableOption "Hyprland, a Wayland compositor";
    };
  };

  imports = [
    ./hyprland
    ./waybar
    ./lock.nix
    ./wofi
    ./wlogout
    ./swayosd.nix
    ./swaync
  ];
}
