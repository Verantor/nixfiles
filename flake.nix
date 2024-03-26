{
  description = "cornflakes";

  inputs = {
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak/";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.home-manager.follows = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypridle = {
      url = "github:hyprwm/hypridle";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = { url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"; inputs.nixpkgs.follows = "nixpkgs"; };
  };
  nixConfig = {
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };
  outputs =
    { self
    , nixpkgs
    , home-manager
    , nix-flatpak
    , sops-nix
    , ...
    } @ inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        main = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;
          modules = [
            ./hosts/main/configuration.nix
            ./hosts/main/hardware-configuration.nix
            sops-nix.nixosModules.sops
            inputs.home-manager.nixosModules.default
            nix-flatpak.nixosModules.nix-flatpak
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ver = import ./home;
              home-manager.extraSpecialArgs = inputs;
            }
            {
              nix.settings.trusted-users = [ "ver" ];
            }
          ];
        };
        iso = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/iso/configuration.nix

          ];
        };
        cou = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/cou/configuration.nix

          ];
        };
      };
    };
}
