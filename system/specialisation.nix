{ config, ... }: {
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
