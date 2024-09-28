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

  cfg = config.sys.gnome;
in
{
  options = {
    sys.gnome = {
      enable = mkEnableOption "GNOME, a desktop environment";
    };
  };
  imports = mkIf cfg.sys.gnome [
    ./gnome.nix
  ];
}
