{ pkgs
, lib
, inputs
, ...
}:
{

  imports = [ ./config.nix ./binds.nix ./rules.nix ./swww.nix ];
  home.packages = with pkgs;
    #with inputs.hyprcontrib.packages.${pkgs.system}; 
    [
      hyprnome #TODO do config

      playerctl
      libnotify
      wf-recorder
      pamixer
      slurp
      #hyprshot
      hyprpicker

      swappy
      wl-clip-persist
      wl-clipboard
      cliphist
      pavucontrol
      udiskie
      baobab # Disk usage analyser
      fd # Find alternative TODO move to cli
      gnome.file-roller # Archive file manager
      gnome.gnome-calculator # Calculator
      gnome.gnome-disk-utility # Disks manager
      gnome.nautilus # File manager
      # (writeShellScriptBin
      #   "pauseshot"
      #   ''
      #     ${hyprpicker}/bin/hyprpicker -r -z &
      #     picker_proc=$!

      #     ${grimblast}/bin/grimblast save area - | tee ~/pics/ss$(date +'screenshot-%F') | wl-copy

      #     kill $picker_proc
      #   '')
      # (
      #   writeShellScriptBin "micmute"
      #     ''
      #       #!/bin/sh

      #       # shellcheck disable=SC2091
      #       if $(pamixer --default-source --get-mute); then
      #         pamixer --default-source --unmute
      #         sudo mic-light-off
      #       else
      #         pamixer --default-source --mute
      #         sudo mic-light-on
      #       fi
      #     ''
      # )
    ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    plugins = [
    ];
    package = inputs.hyprland.packages.${pkgs.system}.default;
    systemd = {
      variables = [ "--all" ];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };

  services = {
    # yeah, I could've just used waybar, but coding this thing was fun. both use pretty much same libs so memory usage is comparable
    wlsunset = {
      # TODO: fix opaque red screen issue
      enable = true;
      latitude = "52.0";
      longitude = "21.0";
      temperature = {
        day = 6200;
        night = 3750;
      };
      systemdTarget = "hyprland-session.target";
    };
  };
  # fake a tray to let apps start
  # https://github.com/nix-community/home-manager/issues/2064
  # systemd.user.targets.tray = {
  #   Unit = {
  #     Description = "Home Manager System Tray";
  #     Requires = [ "graphical-session-pre.target" ];
  #   };
  # };

  # systemd.user.services = {
  #   swaybg = mkService {
  #     Unit.Description = "Wallpaper chooser";
  #     Service = {
  #       ExecStart = "${lib.getExe pkgs.swaybg} -i ${theme.wallpaper}";
  #       Restart = "always";
  #     };
  #   };
  # };
}
