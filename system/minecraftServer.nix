{ inputs, pkgs, ... }:
let
  modpack = pkgs.fetchPackwizModpack {
    url = "https://raw.githubusercontent.com/Verantor/Modpack-Odd-Fabric-21/v1.0.0/pack.toml";
    packHash = "sha256-40934113bbb230bd1afa0352cba52e810a4f4d76620eaf8ac9d30b56e96c39b6=";
  };
in
{
  environment.systemPackages = with pkgs; [
    packwiz
  ];
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
        "mods" = "${modpack}/mods";
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
