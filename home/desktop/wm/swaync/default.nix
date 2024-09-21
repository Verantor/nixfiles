{ ... }: {
  services.swaync = {
    enable = true;
    style = ''
      .notification-row {
        outline: none;
      }

      .notification-row:focus
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
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "user";

      "control-center-width" = 380;
      "control-center-height" = 860;
      "control-center-margin-top" = 2;
      "control-center-margin-bottom" = 2;
      "control-center-margin-right" = 1;
      "control-center-margin-left" = 0;

      "notification-window-width" = 400;
      "notification-icon-size" = 48;
      "notification-body-image-height" = 160;
      "notification-body-image-width" = 200;

      "timeout" = 4;
      "timeout-low" = 2;
      "timeout-critical" = 6;

      "fit-to-screen" = false;
      "keyboard-shortcuts" = true;
      "image-visibility" = "when-available";
      "transition-time" = 200;
      "hide-on-clear" = false;
      "hide-on-action" = false;
      "script-fail-notify" = true;

      notification-2fa-action = true;
      notification-inline-replies = false;
      "notification-visibility" = {
        "example-name" = {
          "state" = "muted";
          "urgency" = "Low";
          "app-name" = "Spotify";
        };
      };

      "widgets" = [
        "label"
        "buttons-grid"
        "mpris"
        "title"
        "dnd"
        "notifications"
      ];
      "widget-config" = {
        "title" = {
          "text" = "Notifications";
          "clear-all-button" = true;
          "button-text" = " 󰎟 ";
        };
        "dnd" = {
          "text" = "Do not disturb";
        };
        "label" = {
          "max-lines" = 1;
          "text" = " ";
        };
        "mpris" = {
          "image-size" = 96;
          "image-radius" = 12;
        };
        "volume" = {
          "label" = "󰕾";
          "show-per-app" = true;
        };
        "buttons-grid" = {
          "actions" = [
            {
              "label" = " ";
              "command" = "swayosd-client --output-volume mute-toggle";
            }
            {
              "label" = "";
              "command" = "wayosd-client --input-volume mute-toggle";
            }
            {
              "label" = " ";
              "command" = "nm-connection-editor";
            }
            {
              "label" = "󰂯";
              "command" = "blueman-manager";
            }
            {
              "label" = "󰏘";
              "command" = "select-wall";
            }
          ];
        };
      };
    };
  };
}
