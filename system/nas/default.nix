{ ... }: {
  imports = [
    ./immich.nix
    ./dashboard.nix
    ./mealie.nix
    ./filesharing.nix
    ./filebrowser.nix
    ../minecraftServer.nix
  ];
}
