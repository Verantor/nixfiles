{ pkgs, ... }:
let
  user = "filebrowser";

  dataDir = "/var/lib/filebrowser";

  settings = {
    port = 8020;
    baseURL = "";
    address = "0.0.0.0";
    log = "stdout";
    database = "${dataDir}/filebrowser.db";
    root = "";
    "auth.method" = "json";
    username = "${user}";
    # Generate password: htpasswd -nBC 10 "" | tr -d ':\n'
    password = "test";
  };
in
{
  environment.etc."filebrowser/.filebrowser.json".text = builtins.toJSON settings;

  systemd.services.filebrowser = {
    description = "Filebrowser cloud file services";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    startLimitIntervalSec = 14400;
    startLimitBurst = 10;
    serviceConfig = {
      ExecStart = "${pkgs.filebrowser}/bin/filebrowser";
      # DynamicUser = !config.services.nextcloud.enable; # Unique user if not using Nextcloud
      User = user;
      Group = user;
      ReadWritePaths = [ dataDir ];
      StateDirectory = [ "filebrowser" ];
      Restart = "on-failure";
      RestartPreventExitStatus = 1;
      RestartSec = "5s";
    };
  };
}
