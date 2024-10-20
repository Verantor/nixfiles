_: {
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      "blur,wlogout"
      "blur, logout_dialog"
      "blur,gtk-layer-shell"
      "blur, notifications"
      # "blur,swaync"
      # "ignorezero,swaync"
      "blur,waybar"
      "ignorezero,waybar"
      "ignorezero,gtk-layer-shell"

      "xray 1, waybar"
      "ignorezero, swaync-control-center"
      "ignorezero, swaync-notification-window"
      "ignorealpha 0.5, swaync-control-center"
      "ignorealpha 0.5, swaync-notification-window"
      "blur, swaync-control-center"
      "blur, swaync-notification-window"
    ];
    windowrulev2 = [
      # only allow shadows for floating windows
      "noshadow, floating:0"
      "tile, title:Spotify"

      "idleinhibit focus, class:^(mpv)$"
      #"idleinhibit focus,class:foot"
      "idleinhibit fullscreen, class:^(firefox)$"

      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"

      #"stayfocused, title:^(),class:^(steam)"
      #"minsize 1 1 , title:^(),class:^(steam)"

      "float, class:^(Vtk)$"
      "center, class:^(Vtk)$"
      "size 900 500, class:^(Vtk)$"

      # throw sharing indicators away
      "workspace special silent, title:^(Firefox — Sharing Indicator)$"
      "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"

      #"workspace 4, title:^(.*(Disc|WebC)ord.*)$"
      #"workspace 2, class:^(firefox)$"

      "opacity 0.0 override,class:^(xwaylandvideobridge)$"
      "noanim,class:^(xwaylandvideobridge)$"
      "noinitialfocus,class:^(xwaylandvideobridge)$"
      "maxsize 1 1,class:^(xwaylandvideobridge)$"
      "noblur,class:^(xwaylandvideobridge)$"

      "immediate, class:^(cs2)$"

      "noanim, class:^(fuzzel)$"
      "move cursor,class:REAPER,floating:1"
      "nofocus,class:REAPER,title:^(menu)$"
      "nofocus,class:REAPER,title:^$"
    ];
    windowrule = [
      "float, fuzzel"
      "animation none,fuzzel"
    ];
  };
}
