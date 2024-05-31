''
  * {
    min-height: 0;
    font-family: Lexend, "JetBrainsMonoNL Nerd Font";
    font-size: 16px;
    font-weight: 500;
  }

  window#waybar {
    transition-property: background-color;
    transition-duration: 0.5s;
    /* background-color: #1e1e2e; */
    /* background-color: #181825; */
    background-color: rgba(24, 24, 37, 0.6);
  }

  window#waybar.hidden {
    opacity: 0.5;
  }

  #workspaces {
    background-color: transparent;
  }

  #workspaces button {
    all: initial;
    min-width: 0;
    box-shadow: inset 0 -3px transparent;
    padding: 2px 10px;
    min-height: 0;
    margin: 4px 4px;
    border-radius: 8px;
    background-color: #181825;
    color: #cdd6f4;
  }

  #workspaces button:hover {
    box-shadow: inherit;
    text-shadow: inherit;
    color: #1e1e2e;
    background-color: #cdd6f4;
  }

  #workspaces button.active {
    color: #1e1e2e;
    background-color: #89b4fa;
  }

  #workspaces button.urgent {
    background-color: #f38ba8;
  }

  #clock,
  #network,
  #cpu,
  #tray,
  #battery,
  #backlight,
  #memory,
  #workspaces,
  #custom-search,
  #custom-power,
  #custom-todo,
  #custom-lock,
  #custom-weather,
  #custom-btc,
  #custom-eth,
  #custom-kdeconnect,
  #volume,
  #privacy,
  #pulseaudio,
  #custom-wallpaper{
    min-height: 0;
    padding: 2px 10px;
    border-radius: 8px;
    margin: 4px 4px;
    background-color: #181825;
  }

  #custom-sep {
    padding: 0px;
    color: #585b70;
  }

  #custom-spotify.playing {
    color: #cdd6f4;
  }

  #custom-spotify.liked {
    color: #f9e2af;
  }
  #custom-spotify.added {
    color: #cba6f7;
  }

  #custom-spotify.removed {
    color: #f38ba8;
  }

  #custom-spotify.paused {
    color: #9399b2;
  }

  window#waybar.empty #window {
    background-color: transparent;
  }

  #cpu {
    color: #94e2d5;
  }

  #memory {
    color: #cba6f7;
  }

  #clock {
    color: #74c7ec;
  }

  #clock.simpleclock {
    color: #89b4fa;
  }

  #window {
    color: #a6e3a1;
  }

  #pulseaudio {
    color: #b4befe;
  }

  #pulseaudio.muted {
    color: #a6adc8;
  }

  #custom-logo {
    color: #89b4fa;
  }

  #custom-power {
    color: #f38ba8;
    padding-right: 5px;
    font-size: 14px;
  }

  @keyframes blink {
    to {
      background-color: #f38ba8;
      color: #181825;
    }
  }

  tooltip {
    border-radius: 8px;
  }
''
