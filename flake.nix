{
  description = "cornflakes";

  inputs = {
    #nix-flatpak.url = "github:gmodena/nix-flatpak/";
    #?rev=fa466badd86e776cbd8e042d85cbfeeccf7e8869
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/"; #nixos-24.05
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # walker.url = "github:abenz1267/walker";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:nixos/nixos-hardware";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
    };

    #chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim-config.url = "github:nicolas-goudry/nixvim-config";

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    nixvimConfig = {
      url = "path:./pkgs/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    { self
    , nixpkgs
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
      core = ./system/core;
      bootloader = ./system/core/boot.nix;
      sunshine = ./system/sunshine.nix;
      services = ./system/services.nix;
      gaming = ./system/gaming.nix;
      amd = ./system/amd.nix;
      sops = ./system/sops.nix;
      scripts = ./system/scripts.nix;
      networking = ./system/core/networking.nix;
      polkit = ./system/polkit.nix;
      openrgb = ./system/openrgb.nix;
      borg = ./system/borg.nix;
      theme = ./theme/stylix.nix;
      keyboard = ./system/keyboard.nix;
      server = ./system/server.nix;
      minecraftServer = ./system/minecraftServer.nix;
      virt = ./system/virt.nix;
      hmModule = inputs.home-manager.nixosModules.home-manager;
      flatpak = inputs.nix-flatpak.nixosModules.nix-flatpak;
      nixDB = inputs.nix-index-database.nixosModules.nix-index;
      stylix = inputs.stylix.nixosModules.stylix;
      #chaotic = inputs.chaotic.nixosModules.default;
      shared = [ core sops ];

      home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        extraSpecialArgs = {
          inherit inputs;
          inherit self;
          inherit outputs;
        };
        sharedModules = [
          {
            stylix = {
              targets = {
                mangohud.enable = false;
                waybar.enable = false;
                hyprpaper.enable = false;
                hyprland.enable = false;
              };
            };
          }
        ];

        users.ver = {
          imports = [ ./home ];
          _module.args.theme = import ./theme;
        };
      };
    in
    #rec for recursion
    {
      overlays = import ./system/overlays.nix { inherit inputs; };

      nixosConfigurations = {
        main = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules =
            [
              { networking.hostName = "main"; }

              ./hosts/main
              amd #
              bootloader
              services #
              gaming #
              # sunshine #
              hmModule #
              scripts
              networking
              polkit
              borg
              openrgb
              nixDB
              stylix
              theme
              keyboard
              #chaotic
              server
              flatpak
              minecraftServer
              virt
              { inherit home-manager; } #
            ]
            ++ shared;
          specialArgs = { inherit inputs outputs; };
        };
      };
    };
}
