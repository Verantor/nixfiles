''
  * {
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: Material Design Icons, JetBrainsMonoNL Nerd Font;
  }

  window#waybar {
    background-color: rgba(48, 52, 70, 0.2);
    border-radius: 0px;
    color: #c6d0f5;
    font-size: 10px;
    /* transition-property: background-color; */
    transition-duration: 0.5s;
    
  }

  window#waybar.hidden {
    opacity: 0.2;
  }

  #workspaces {
    font-size: 10px;
    background-color:  rgba(65,69,89,0.3) ;
  }

  #pulseaudio {
    color: #a6d189;
  }
  #network {
    color: #8caaee;
  }

  #custom-search,
  #clock {
    background-color:  rgba(65,69,89,0.3) ;
  }

  #workspaces button {
    background-color: transparent;
    color: #8caaee;
    /* Use box-shadow instead of border so the text isn't offset */
    box-shadow: inset 0 -3px transparent;
  }

  /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
  #workspaces button:hover {
    color: #85c1dc;
  }

  #custom-power {
      color: #e78284;
  }

  #custom-lock {
      color: #8caaee;
  }

  #workspaces button.active {
    color: #e5c890;
  }

  #workspaces button.urgent {
    background-color: #e78284;
  }

  #clock,
  #network,
  #cpu,
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
  #custom-wallpaper
   {
    border-radius: 12px;

    margin-bottom: 0px;
    background-color: rgba(65, 69, 89, 0.3);
    padding: 0px 10px 0px 10px;
  }

  #mpris.paused.kdeconnect {
    opacity: 0;
  }
  #custom-power {
    padding: 0px 10px 0px 10px;
  }
    #custom-search {
    padding: 0px 0px 0px 0px;

  }


  #backlight {
    padding-right: 2px;
    color: #e5c890;
  }
  #battery {
    color: #a6d189;
  }

  #battery.warning {
    color: #ef9f76;
  }

  #battery.critical:not(.charging) {
    color: #e78284;
  }
  tooltip {
    font-family: 'JetBrainsMonoNL Nerd Font', sans-serif;
    border-radius: 15px;
    padding: 20px;
    margin: 30px;
  }
  tooltip label {
    font-family: 'JetBrainsMonoNL Nerd Font', sans-serif;
    padding: 20px;
  }
''
