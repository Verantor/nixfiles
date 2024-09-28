{ lib
, config
, ...
}: {
  config = {
    programs.hyprlock = lib.mkIf config.hyprland.enable {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 10;
          hide_cursor = true;
          no_fade_in = false;
        };

        background = [
          {
            path = "screenshot";
            blur_passes = 3;
            blur_size = 40;
          }
        ];

        input-field = [
          {
            monitor = "";
            size = "250, 60";
            outline_thickness = 2;
            dots_size = 0.2;
            dots_spacing = 0.2;
            dots_center = true;
            outer_color = "rgba(0, 0, 0, 0)";
            inner_color = "rgba(0, 0, 0, 0.5)";
            font_color = "rgb(200, 200, 200)";
            fade_on_empty = false;
            placeholder_text = ''<i><span foreground="##cdd6f4">Input Password...</span></i>'';
            hide_input = false;
            position = "0, -120";
            halign = "center";
            valign = "center";
          }
        ];
        label = [
          {
            monitor = "";
            text = "$TIME";
            font_size = 120;
            position = "0, 80";
            valign = "center";
            halign = "center";
          }
        ];
      };
    };
    services.hypridle = lib.mkIf config.hyprland.enable {
      enable = true;
      settings = {
        general = {
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = true;
          lock_cmd = "hyprlock";
        };

        listener = [
          {
            timeout = 900;
            on-timeout = "hyprlock";
          }
          {
            timeout = 1200;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
