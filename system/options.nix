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
        enable = mkOption {
          type = types.bool;
          default = false;
          description = "GNOME, a desktop environment";
        };
      };
      hyprland = {
        enable = mkOption {
          type = types.bool;
          default = true;
          description = "Hyprland, a custom desktop environment";
        };
      };
    };
  };
}
