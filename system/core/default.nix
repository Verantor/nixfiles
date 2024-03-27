{ ... }: {
  imports = [
    ./networking.nix
    ./nix.nix
    ./system.nix
    ./users.nix
  ];
}
