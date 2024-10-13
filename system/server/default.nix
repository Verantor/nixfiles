{ ... }: {
  imports = [
    ./3dPrinter
    ./blocky.nix
    ./nixarr.nix
    ./podman.nix
    ./dashboard.nix
    ./wireguard.nix
    ./smallservices.nix
    ./containers
  ];
}
