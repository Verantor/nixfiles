{ inputs, pkgs, ... }:

{

  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
  services.minecraft-servers = {
    eula = true;
    enable = true;

    servers.modded-minecraft-server = {
      enable = true;
      autoStart = true;
      openFirewall = true;
      package = pkgs.fabricServers.fabric-1_21_1;
      symlinks = {
        "mods" = "/srv/minecraft/mods";
      };
      #restart = "always";
      serverProperties = {
        server-port = 25565;
        seed = 123456789;
        difficulty = 3;
        gamemode = 1;
        max-players = 10;
        motd = "swans in mein arsch";
        white-list = false;
        enable-rcon = false;
        jvmOpts = "-Xms8184M -Xmx8184M";
      };
    };
  };

  #connent to server with: tmux -S /run/minecraft/modded-minecraft-server.sock attach
  #start with systemctl start minecraft-server-servername


  #   services.minecraft-server = {
  #   enable = true;
  #   eula = true;
  #   package = pkgs.unstable.minecraft-server;
  #   jvmOpts = "-Xms8184M -Xmx8184M";
  # };
}
