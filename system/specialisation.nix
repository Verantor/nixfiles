{ ... }: {
  specialisation = {
    hyprland.configuration = {
      sys.hyprland.enable = true;
      sys.gnome.enable = false;
    };
    gnome.configuration = {
      sys.hyprland.enable = false;
      sys.gnome.enable = true;
    };
  };
}
