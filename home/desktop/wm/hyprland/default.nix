{ pkgs
, inputs
, lib
, config
, ...
}: {
  imports = [ ./config.nix ./binds.nix ./rules.nix ./swww.nix ];
  # lib.mkIf config.sys.hyprland.enable
  config = {
    wayland.windowManager.hyprland = {
      enable = lib.mkIf config.sys.hyprland.enable;
      xwayland.enable = true;
      plugins = [
        inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
        inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
      ];
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      systemd = {
        variables = [ "--all" ];
        extraCommands = [
          "systemctl --user stop graphical-session.target"
          "systemctl --user start hyprland-session.target"
        ];
      };
    };

    services = {
      wlsunset = {
        # TODO: fix opaque red screen issue
        enable = lib.mkIf config.sys.hyprland.enable;
        latitude = "52.0";
        longitude = "21.0";
        temperature = {
          day = 6500;
          night = 3500;
        };
        systemdTarget = "graphical-session.target";
      };
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
