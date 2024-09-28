{ lib, ... }:
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
    sys = {
      gnome = {
        enable = mkEnableOption "GNOME, a desktop environment";
      };
      hyprland = {
        enable = mkEnableOption "Hyprland, a Wayland compositor";
      };
    };
  };
}
