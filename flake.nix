{
  description = "cornflakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = {self, nixpkgs, ...}@inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      who = lib.nixosSystem{
        specialArgs = {inherit inputs;};
          inherit system;
          modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.default

        ];
      };
    };
    
  };
  
}
