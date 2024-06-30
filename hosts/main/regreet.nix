{ config
, lib
, ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getExe config.programs.hyprland.package}";
        user = "ver";
      };
      initial_session = {
        command = "${lib.getExe config.programs.hyprland.package} --config /home/ver/.config/greetd/hyprland.conf";
        user = "greeter";
      };
    };
  };
  home.file.".config/greetd/hyprland.conf" = {
    enable = true;
    text = ''
      exec-once = regreet; hyprctl dispatch exit
    '';
  };

  # programs.regreet = {
  #   cageArgs = [ "-s" "-m" "last" ];
  #   enable = true;
  #   settings = {
  #     background.path = ../../theme/wallpapers/wall2.png;
  #     fit = "Cover";
  #     gtk = {
  #       # Whether to use the dark theme
  #       application_prefer_dark_theme = true;
  #
  #       # Cursor theme name
  #       cursor_theme_name = "Bibata-Modern-Ice";
  #
  #       # Font name and size
  #       font_name = "JetBrainsMono 16";
  #
  #       # Icon theme name
  #       icon_theme_name = "Adwaita";
  #
  #       # GTK theme name
  #       theme_name = "Adwaita";
  #     };
  #     commands = {
  #       # The command used to reboot the system
  #       reboot = [ "systemctl" "reboot" ];
  #
  #       # The command used to shut down the system
  #       poweroff = [ "systemctl" "poweroff" ];
  #     };
  #   };
  # };
}
