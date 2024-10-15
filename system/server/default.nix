{ ... }: {
  imports = [
    ./3dPrinter
    ./nixarr.nix
    ./podman.nix
    ./dashboard.nix
    ./wireguard.nix
    ./smallservices.nix
    ./containers
  ];
}
