_: {
  programs.waybar = {
    enable = true;
    style = import ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 7;
        modules-left = [
          "custom/search"
          "hyprland/workspaces"
        ];
        modules-center = [
          # "hyprland/window"
          "clock"
        ];
        modules-right = [
          "gamemode"
          "mpris"
          "tray"
          "wireplumber"
          # "network"
          #"custom/kdeconnect"
          "privacy"
          #"custom/wallpaper"
          #"custom/lock"
          "custom/notification"
          "custom/power"
        ];
        "custom/notification" = {
          "tooltip" = false;
          "format" = "{icon}";
          "format-icons" = {
            "notification" = "<span foreground='red'><sup></sup></span>";
            "none" = "";
            "dnd-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-none" = "";
            "inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "inhibited-none" = "";
            "dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-inhibited-none" = "";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "swaync-client -swb";
          "on-click" = "swaync-client -t -sw";
          "on-click-right" = "swaync-client -d -sw";
          "escape" = true;
        };
        "hyprland/workspaces" = {
          on-click = "activate";
          format = "{icon}";
          active-only = false;
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";

          persistent-workspaces = {
            "*" = 5;
          };
        };
        "hyprland/window" = {
          "format" = "{icon} {title}";
          "max-length" = 50;
          "separate-outputs" = true;
          # icon = true;
        };
        "custom/search" = {
          format = " ";
          tooltip = false;
          on-click = "anyrun";
        };
        "custom/wallpaper" = {
          format = " 󰸉  ";
          tooltip = false;
          on-click = "select-wall.sh";
        };

        "custom/lock" = {
          tooltip = false;
          on-click = "sh -c '(sleep 0.5s; hyprlock)' & disown";
          format = "";
        };
        mpris = {
          "status-icons" = {
            "paused" = "󰏤";
            "stopped" = "󰓛";
          };
          "player-icons" = {
            "default" = "▶";
            "kdeconnect" = "";
            "spotify" = "󰓇";
            "firefox" = "󰈹";
            "floorp" = "󰈹";
          };
          "dynamic-order" = [
            "title"
            "artist"
            "album"
            "position"
            "length"
          ];
          "dynamic-importance-order" = [
            "title"
            "position"
            "length"
            "artist"
            "album"
          ];
          "title-len" = 10;
          "artist-len" = 10;
          "album-len" = 10;
          "dynamic-len" = 20;
          "format" = "{player_icon} {dynamic}";
          "format-paused" = "{status_icon} <i>{dynamic}</i>";
        };
        tray = {
          "icon-size" = 25;
          "spacing" = 5;
          "show-passive-items" = true;
        };
        privacy = {
          "icon-spacing" = 4;
          "icon-size" = 10;
          "transition-duration" = 200;
          "modules" = [
            {
              "type" = "screenshare";
              "tooltip" = true;
              "tooltip-icon-size" = 24;
            }
            {
              "type" = "audio-in";
              "tooltip" = true;
              "tooltip-icon-size" = 24;
            }
          ];
        };
        "custom/power" = {
          tooltip = false;
          on-click = "wlogout &";
          format = " ";
        };
        clock = {
          format = ''
            {:%H %M}'';
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };
        "custom/kdeconnect" = {
          "exec" = "sh waybar-kde-connect.sh battery";
          "format" = "{}";
          "on-click" = "kdeconnect-settings";
          interval = 30;
        };
        network = {
          "format" = "{ifname}";
          "format-wifi" = "{icon} {essid}";
          "format-icons" = [
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          "format-ethernet" = "󱎔 {ifname}";
          "format-linked" = "󰌷 {ifname}";
          "format-disconnected" = "󰪎";
          "tooltip-format" = "{ifname} via {gwaddr}";
          "tooltip-format-wifi" = "Connected to {essid} ({signalStrength}󰏰 Strength) over {ifname} via {gwaddr}";
          "tooltip-format-ethernet" = "󱎔 {ifname}";
          "tooltip-disconnected" = "Disconnected";
        };
        gamemode = {
          format = "{glyph}";
          format-alt = "{glyph} {count}";
          glyph = "󰊴";
          hide-not-running = true;
          use-icon = true;
          icon-name = "input-gaming-symbolic";
          icon-spacing = 4;
          icon-size = 20;
          tooltip = true;
          tooltip-format = "Games running: {count}";
        };
        wireplumber = {
          format = "{icon} {volume}󰏰";
          "format-muted" = "󰝟";
          "format-icons" = {
            "default" = [
              ""
              ""
              ""
            ];
          };
          "on-click-right" = "pwvucontrol";
          "on-click" = "setaudio";
          "on-scroll-up" = "pamixer -i 5";
          "on-scroll-down" = "pamixer -d 5";
          "on-click-middle" = "helvum";
          "max-volume" = 150;
          "scroll-step" = 0.2;
        };
      };
    };
  };
}
