{
  description = "cornflakes";

  inputs = {
    #nix-flatpak.url = "github:gmodena/nix-flatpak/";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      # url = "git+file:///Users/khaneliman/Documents/github/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    # xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    # hyprpicker = {
    #   url = "github:hyprwm/hyprpicker";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # hyprland = {
    #   url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    nixos-hardware.url = "github:nixos/nixos-hardware";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
    #   # url = "github:nix-community/nixvim/nixos-23.05";

    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };
  # nixConfig = {
  #   substituters = [
  #     "https://cache.nixos.org"
  #     "https://nix-community.cachix.org"
  #   ];
  #   trusted-public-keys = [
  #     "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  #     "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  #   ];
  # };
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
      #overlays = ./system/overlays.nix;
      borg = ./system/borg.nix;
      theme = ./theme/stylix.nix;
      keyboard = ./system/keyboard.nix;
      server = ./system/server.nix;
      hmModule = inputs.home-manager.nixosModules.home-manager;
      #flatpak = inputs.nix-flatpak.nixosModules.nix-flatpak;
      nixDB = inputs.nix-index-database.nixosModules.nix-index;
      stylix = inputs.stylix.nixosModules.stylix;
      chaotic = inputs.chaotic.nixosModules.default; # OUR DEFAULT MODULE
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
              ({ pkgs, ... }: {
                nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
                environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
              })
              ./hosts/main
              amd #
              bootloader
              services #
              gaming #
              sunshine #
              hmModule #
              scripts
              networking
              polkit
              borg
              openrgb
              #flatpak
              nixDB
              stylix
              theme
              keyboard
              chaotic
              server
              { inherit home-manager; } #
            ]
            ++ shared;
          specialArgs = { inherit inputs outputs; };
        };
      };
    };
}
