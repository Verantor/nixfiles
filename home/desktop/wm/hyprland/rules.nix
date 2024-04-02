{ ... }: {
  wayland.windowManager.hyprland.settings = {
    layerrule = [

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


      "float, class:^(imv)$"

      # throw sharing indicators away
      "workspace special silent, title:^(Firefox — Sharing Indicator)$"
      "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"

      #"workspace 4, title:^(.*(Disc|WebC)ord.*)$"
      #"workspace 2, class:^(firefox)$"
    ];
  };
}
