{ config, ... }:
let
  cfg = config.sys;
in
{
  specialisation = {
    hyprland.configuration = {
      system.nixos.tags = [ "hyprland" ];
      cfg.hyprland.enable = true;
      cfg.gnome.enable = false;
    };
    gnome.configuration = {
      system.nixos.tags = [ "gnome" ];
      cfg.hyprland.enable = false;
      cfg.gnome.enable = true;
    };
  };
}
