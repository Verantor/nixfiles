{ inputs, pkgs, ... }:
let
  # modpack = pkgs.fetchPackwizModpack {
  #   url = "https://github.com/Verantor/Modpack-Odd-Fabric-21/raw/0.1.1/pack.toml";
  #   packHash = "sha256-L5RiSktqtSQBDecVfGj1iDaXV+E90zrNEcf4jtsg+wk=";
  # };
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
        #  "mods" = "${modpack}/*";
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
