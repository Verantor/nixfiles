{ pkgs
, lib
, config
, theme
, ...
}:
let
  font_family = "JetBrains Mono Nerd Font Mono";
in
{
  # programs.hyprlock = with theme.colors; {
  #   package = pkgs.hyprlock;
  #   enable = true;
  #   general = {
  #     disable_loading_bar = false;
  #     hide_cursor = false;
  #     no_fade_in = false;
  #   };

  #   backgrounds = [
  #     {
  #       monitor = "";
  #       path = "${theme.wallpaper}/wall2.png";
  #       blur_passes = 3;
  #       blur_size = 7;
  #       noise = 0.0117;
  #       contrast = 0.8916;
  #       brightness = 0.8172;
  #       vibrancy = 0.1696;
  #       vibrancy_darkness = 0.0;
  #     }
  #   ];

  #   input-fields = [
  #     {
  #       monitor = "DP-2";

  #       size = {
  #         width = 300;
  #         height = 50;
  #       };
  #       halign = "center";
  #       valign = "center";
  #       outline_thickness = 2;

  #       outer_color = "rgb(${accent})";
  #       inner_color = "rgb(${base})";
  #       font_color = "rgb(${text})";

  #       fade_on_empty = false;
  #       #"font_family" = "JetBrains Mono Nerd Font Mono";
  #       placeholder_text = ''<i><span font_family="${font_family}" foreground="##${subtext1}">Input Password...</span></i>'';

  #       dots_spacing = 0.3;
  #       dots_center = true;
  #     }
  #   ];

  #   labels = [
  #     {
  #       monitor = "";
  #       text = "$TIME";
  #       color = "rgba(${base}bf)";
  #       #color = rgba(255, 255, 255, 0.6);
  #       font_size = 120;
  #       "font_family" = "JetBrains Mono Nerd Font Mono ExtraBold";
  #       position = {
  #         x = 0;
  #         y = -300;
  #       };
  #       halign = "center";
  #       valign = "top";
  #     }
  #   ];
  # };
  # services.hypridle = {
  #   enable = true;
  #   beforeSleepCmd = "${pkgs.systemd}/bin/loginctl lock-session";
  #   lockCmd = lib.getExe config.programs.hyprlock.package;

  #   listeners = [
  #     {
  #       timeout = 330;
  #       #on-timeout = "notify-send 'You are idle!'";
  #       #on-resume = "notify-send 'Welcome back!'";
  #     }
  #   ];
  # };
}
