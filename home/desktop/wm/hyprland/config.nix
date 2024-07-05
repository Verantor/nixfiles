{ config
, theme
, lib
, ...
}:
let
  pointer = config.home.pointerCursor;
  swayosd = lib.getExe' pkgs.swayosd "swayosd-client";
in
{
  wayland.windowManager.hyprland = with theme.colors; {
    settings = {
      exec-once = [
        # "swww-daemon"
        # "swww img ${theme.wallpaper}/leaves-wall.png"
        "waybar"
        "hypridle"

        #"dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        #"xwaylandvideobridge"
        "wl-paste --type text --watch cliphist store" #Stores only text data
        "udiskie &"
        { command = lib.getExe' pkgs.swayosd "swayosd-server"; }
        "wl-paste --type image --watch cliphist store" #Stores only image data
        # set cursor for HL itself
        "hyprctl setcursor ${pointer.name} ${toString pointer.size}"
      ];

      xwayland = {
        force_zero_scaling = true;
      };

      input = {
        # keyboard layout
        kb_layout = "us";
        kb_options = "";
        follow_mouse = 1;
        sensitivity = 0;
      };

      general = {
        # gaps
        gaps_in = 2;
        gaps_out = 4;

        # border thiccness
        border_size = 2;
        layout = "dwindle";
        # active border color
        # "col.active_border" = "rgb(${accent})";
        # "col.inactive_border" = "rgb(${surface0})";
        resize_on_border = true;
        # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
        apply_sens_to_raw = 0;
        allow_tearing = false;
      };

      decoration = {
        # fancy corners
        rounding = 10;

        # blur
        blur = {
          enabled = true;
          size = 12;
          passes = 3;
          ignore_opacity = false;
          new_optimizations = 1;
          xray = true;
          contrast = 0.7;
          brightness = 0.8;
          popups = true;
        };

        # shadow config
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 5;
        # "col.shadow" = "rgba(292c3cee)";
      };

      misc = {
        # disable redundant renders
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;

        vrr = 0;
        vfr = true;

        # dpms
        mouse_move_enables_dpms = true; # enable dpms on mouse/touchpad action
        key_press_enables_dpms = true; # enable dpms on keyboard action
        disable_autoreload = true; # autoreload is unnecessary on nixos, because the config is readonly anyway
      };

      animations = {
        enabled = true;
        first_launch_animation = false;

        bezier = [
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
          "overshot, 0.4,0.8,0.2,1.2"
        ];

        animation = [
          "windows, 1, 4, overshot, slide"
          "windowsOut, 1, 4, smoothOut, slide"
          "border,1,10,default"

          "fade, 1, 10, smoothIn"
          "fadeDim, 1, 10, smoothIn"
          "workspaces,1,4,overshot,slidevert"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        no_gaps_when_only = false;
      };

      #  "$kw" = "dwindle:no_gaps_when_only";

      monitor = [
        "DP-2,1920x1080@144,0x0,1"
        "HDMI-A-1,1920x1200@60Hz,-1920x0,1"
      ];
    };
  };
}
