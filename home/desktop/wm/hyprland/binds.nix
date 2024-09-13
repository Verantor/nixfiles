_:
let
  mod = "SUPER";
  modshift = "${mod}SHIFT";
  # binds $mod + [shift +] {1..10} to [move to] workspace {1..10} (stolen from fufie)
  # workspaces = builtins.concatLists (builtins.genList
  #   (
  #     x:
  #     let
  #       ws =
  #         let
  #           c = (x + 1) / 10;
  #         in
  #         builtins.toString (x + 1 - (c * 10));
  #     in
  #     [
  #       "${mod}, ${ws}, workspace, ${toString (x + 1)}"
  #       "${mod} SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
  #     ]
  #   )
  #   10);
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "${mod},SPACE,exec,fuzzel" #-show drun
      "${mod},T,exec,foot"
      "${mod},C,killactive"
      "${mod},P,pseudo"
      "${mod},E,exec,nautilus"
      "${mod},F,exec,firefox"
      "${mod},H,movefocus,l"
      "${mod},L,movefocus,r"
      "${mod},K,movefocus,u"
      "${mod},J,movefocus,d"

      "${mod},G,togglegroup," # group focused window
      "${modshift},G,changegroupactive," # switch within the active group
      "${mod},V,togglefloating," # toggle floating for the focused window
      "${modshift},F,fullscreen," # fullscreen focused window

      "${modshift},P, exec, hyprshot -m window" # screenshot focused window
      "${modshift},R, exec, hyprshot -m region" # screenshot focused region
      "${modshift},E, exec, hyprshot -m output --raw | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png"
      "${modshift}, G, exec, gamemode-hyprland"
      "${mod},1, exec, hyprnome --previous"
      "${mod},2, exec, hyprnome"
      "${modshift},1, exec, hyprnome --previous --move"
      "${modshift},2, exec, hyprnome  --move"
      "${modshift},W,exec, overview:toggle"
      # workspace controls
      "${modshift},L,movetoworkspace,+1" # move focused window to the next ws
      "${modshift},H,movetoworkspace,-1" # move focused window to the previous ws
      "${mod},mouse_down,workspace,e+1" # move to the next ws
      "${mod},mouse_up,workspace,e-1" # move to the previous ws

      "${mod}, B, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
      "${mod}, D, exec, selectCommands"
      "${mod},ESC,exec,hyprlock"

      # ",XF86AudioRaiseVolume,exec,pamixer -i 5"
      # ",XF86AudioLowerVolume,exec,pamixer -d 5"
      # ",XF86AudioMicMute,exec,pamixer --default-source -m"
      # ",XF86AudioMute,exec,pamixer -t"
      # ",XF87AudioPlay,exec,playerctl play-pause"
      # ",XF86AudioPause,exec,playerctl play-pause"
      # ",XF86AudioNext,exec,playerctl next"
      # ",XF86AudioPrev,exec,playerctl previous"
    ];
    # ++ workspaces;

    bindm = [
      "${mod},mouse:272,movewindow"
      "${mod},mouse:273,resizewindow"
    ];
    #TODO add sway osd commands

    binde = [
      # volume controls
      # ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 10%+ "
      # ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 10%-"
      # ",XF86AudioMute, exec,  wpctl set-mute @DEFAULT_SINK@ toggle "
      # ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle "

      ",XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
      ",XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
      ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
      ",XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
    ];
    # binds that are locked, a.k.a will activate even while an input inhibitor is active
    bindl = [
      # media controls
      ",XF86AudioPlay,exec,playerctl play-pause"
      ",XF86AudioPrev,exec,playerctl previous"
      ",XF86AudioNext,exec,playerctl next"
    ];
  };
}
