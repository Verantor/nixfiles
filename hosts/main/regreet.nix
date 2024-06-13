{ pkgs, ... }: {
  # environment.systemPackages = with pkgs; [
  #   greetd.tuigreet
  # ];
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland --remember --remember-session --user-menu --asterisks";
  #       user = "greeter";
  #     };
  #   };
  # };
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
