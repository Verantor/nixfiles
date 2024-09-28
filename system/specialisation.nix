{ config, ... }:
let
  cfg = config.sys;
in
{
  specialisation = {
    hyprland.configuration = {
      cfg.hyprland.enable = true;
      cfg.gnome.enable = false;
    };
    gnome.configuration = {
      cfg.hyprland.enable = false;
      cfg.gnome.enable = true;
    };
  };
}
