{ ... }: {
  services.swaync = {
    enable = true;
    style = ''
      .notification-row {
        outline: none;
      }

      .notification-row:focus,
      .notification-row:hover {
        background: @noti-bg-focus;
      }

      .notification {
        border-radius: 12px;
        margin: 6px 12px;
        box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 3px 1px rgba(0, 0, 0, 0.7),
          0 2px 6px 2px rgba(0, 0, 0, 0.3);
        padding: 0;
      }
    '';

    settings = {
      positionX = "right";
      positionY = "top"; # Adjusted from "top" to "bottom"
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";

      # Converted attributes for control-center
      control-center-margin-top = 1; # Adjusted margin values
      control-center-margin-bottom = 2;
      control-center-margin-right = 1;
      control-center-margin-left = 0;

      notification-2fa-action = true;
      notification-inline-replies = true; # Adjusted from false to true
      # notification-icon-size = 50; # Adjusted icon size from 64 to 50
      # notification-body-image-height = 140; # Adjusted from 100 to 140
      # notification-body-image-width = 180; # Adjusted from 200 to 180

      # Additional settings that were in the original code but not present in the template
      control-center-width = 350;
      control-center-height = 695;
      notification-window-width = 300;
      # timeout = 6;
      # timeout-low = 3;
      # timeout-critical = 0;
      # fit-to-screen = false;
      # keyboard-shortcuts = true;
      # image-visibility = "when available";
      transition-time = 200;
      # hide-on-clear = false;
      # hide-on-action = true;
      # script-fail-notify = true;

      # Widgets configuration
      widgets = [ "title" "notifications" "mpris" "volume" "backlight" ];

      # Widget-specific configuration
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear";
        };
        dnd = {
          text = " ";
        };
        label = {
          max-lines = 2;
          text = "Notification";
        };
        mpris = {
          image-size = 60;
          image-radius = 10;
        };
        volume = {
          label = "󰕾";
        };
        backlight = {
          label = "󰃟";
        };
        buttons-grid = {
          actions = [
            {
              label = " Wi-FI";
              command = "nm-connection-editor";
            }
            {
              label = "󰕾 Mute";
              command = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
            }
            {
              label = "󰂯 Bluetooth";
              command = "blueman-manager";
            }
            {
              label = "  Theme";
              command = "/home/alien/.config/hypr/scripts/themechanging";
            }
          ];
        };
      };
    };
  };
}
