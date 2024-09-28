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
    sys = {
      gnome = {
        enable = mkEnableOption "GNOME, a desktop environment";
      };
      hyprland = {
        enable = mkEnableOption "Hyprland, a Wayland compositor";
      };
    };
  };
  specialisation = {
    hyprland.configuration = {
      system.nixos.tags = [ "hyprland" ];
      config.sys.hyprland.enable = true;
      config.sys.gnome.enable = false;
    };
    gnome.configuration = {
      system.nixos.tags = [ "gnome" ];
      config.sys.hyprland.enable = false;
      config.sys.gnome.enable = true;
    };
  };
}
