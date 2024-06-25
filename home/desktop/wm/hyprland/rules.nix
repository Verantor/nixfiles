{ ... }: {
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      "blur,waybar"
      "blur,fuzzel"
      "blur,wlogout"

      "blur,gtk-layer-shell"
      "ignorezero,gtk-layer-shell"

      "ignorezero, fuzzel"
      "ignorezero, waybar"
      "xray 1, waybar"
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

      "windowrulev2 = noanim, class:^(fuzzel)$"
    ];
    windowrule = [
      "float, fuzzel"
      "animation none,fuzzel"
    ];
  };
}
