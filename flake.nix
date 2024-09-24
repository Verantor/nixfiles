{
  description = "cornflakes";

  inputs = {
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
    lemonake = {
      url = "github:passivelemon/lemonake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/"; #nixos-24.05
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    woomer.url = "github:coffeeispower/woomer";
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
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
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    Hyprspace = {
      url = "github:KZDKM/Hyprspace";

      # Hyprspace uses latest Hyprland. We declare this to keep them in sync.
      inputs.hyprland.follows = "hyprland";
    };
    #chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim-config.url = "github:nicolas-goudry/nixvim-config";

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    nixvimConfig = {
      url = "path:/home/ver/.dotfiles/nixvim/";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixvim.follows = "nixvim";
    };
    nixarr.url = "github:rasmus-kirk/nixarr";
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
      server = ./system/server.nix;
      minecraftServer = ./system/minecraftServer.nix;
      virt = ./system/virt.nix;
      hmModule = inputs.home-manager.nixosModules.home-manager;
      flatpak = inputs.nix-flatpak.nixosModules.nix-flatpak;
      nixDB = inputs.nix-index-database.nixosModules.nix-index;
      stylixMod = inputs.stylix.nixosModules.stylix;
      nixarr = inputs.nixarr.nixosModules.default;
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
      checks = nixpkgs.lib.genAttrs [ "x86_64-linux" ] (
        system:
        let
          inherit (nixpkgs) lib;
          nixosMachines =
            lib.mapAttrs'
              (
                name: config: lib.nameValuePair "nixos-${name}" config.config.system.build.toplevel
              )
              ((lib.filterAttrs (_: config: config.pkgs.system == system)) self.nixosConfigurations);
        in
        nixosMachines
      );

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
              stylixMod
              theme
              #chaotic
              # server
              flatpak
              minecraftServer
              virt
              { inherit home-manager; } #
            ]
            ++ shared;
          specialArgs = { inherit inputs outputs; };
        };
        orca = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules =
            [
              { networking.hostName = "orca"; }

              ./hosts/orca
              server
              scripts
              # nixarr
              # minecraftServer
              # {inherit home-manager;} #
            ]
            ++ shared;
          specialArgs = { inherit inputs outputs; };
        };
      };
    };
}
