{ config
, lib
, pkgs
, ...
}:
let
  regreetConfig = pkgs.writeText "regreet-config" ''
    [background]
    path = "${../../theme/wallpapers/leaves-wall.png}"
     fit = "Cover"
    [GTK]
    # Whether to use the dark theme
    application_prefer_dark_theme = true

    [appearance]
    # The message that initially displays on startup
    greeting_msg = "Welcome back!"
  '';

  hyprlandConfig = pkgs.writeText "greetd-hyprland-config" ''
    exec-once = swww-deamon
    exec-once = swww img ${../../theme/wallpapers/leaves-wall.png}
    exec-once = ${pkgs.greetd.regreet}/bin/regreet --config ${regreetConfig}; hyprctl dispatch exit
  '';
in
{
  environment.systemPackages = with pkgs; [
    greetd.regreet
    swww
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getExe config.programs.hyprland.package} --config ${hyprlandConfig}";
        # user = "ver";
      };
      # initial_session = {
      #   command = "${lib.getExe config.programs.hyprland.package} --config /home/ver/.config/greetd/hyprland.conf";
      #   user = "greeter";
      # };
    };
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
