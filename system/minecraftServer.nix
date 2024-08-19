{ pkgs, ... }:
let
  modpack = /srv/minecraft;
in
{
  services.minecraft-servers.servers.modded-minecraft-server = {
    enable = true;
    autoStart = true;
    eula = true;
    openFirewall = true;
    package = pkgs.fabricServers.fabric-1_21_1;
    dataDir = "/srv/minecraft";
    symlinks = {
      "mods" = "${modpack}/mods";
    };
    restart = "always";
    serverProperties = {
      server-port = 25565;
      seed = 123456789;
      difficulty = 3;
      gamemode = 1;
      max-players = 10;
      motd = "swans in mein arsch";
      white-list = false;
      enable-rcon = false;
      jvmOpts = "-Xmx4G -Xms8G";
    };
  };
  #connent to server with: tmux -S /run/minecraft/servername.sock attach
  #start with systemctl start minecraft-server-servername


  #   services.minecraft-server = {
  #   enable = true;
  #   eula = true;
  #   package = pkgs.unstable.minecraft-server;
  #   jvmOpts = "-Xms8184M -Xmx8184M";
  # };
}
