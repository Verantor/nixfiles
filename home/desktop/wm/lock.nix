{ pkgs
, lib
, config
, ...
}:
{
  programs.hyprlock = {
    enable = true;
  };
  services.hypridle = {
    enable = true;
  };
}
