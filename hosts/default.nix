{
  nixpkgs,
  self,
  ...
}: let

  inherit (self) inputs;
  core = ../system/core;
  bootloader = ../system/core/boot.nix;
  server = ../system/server.nix;
  sunshine = ../system/sunshine.nix;
  services = ../system/services.nix;
  gaming = ../system/gaming.nix;
  amd = ../system/amd.nix;



  hw = inputs.nixos-hardware.nixosModules;
  agenix = inputs.agenix.nixosModules.age;
  hmModule = inputs.home-manager.nixosModules.home-manager;
  flatpak = inputs.nix-flatpak.nixosModules.nix-flatpak;


  shared = [core agenix];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
      #inherit self;
    };
    users.ver = {
      imports = [../home];

      #_module.args.theme = import ../theme;
    };
  };
in {

  # desktop
  main = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        {networking.hostName = "main";}
        ./main
        amd
        bootloader
        services
        gaming
        sunshine
        hmModule
        flatpak
        {inherit home-manager;}
      ]
      ++ shared;
    specialArgs = {inherit inputs;};
  };

  serverPi = nixpkgs.lib.nixosSystem {
    system = "aarch64";
    modules =
      [
        {networking.hostName = "serverPi";}
        hw.raspberry-pi-4
        server
        ./serverPi
      ]
      ++ shared;
    specialArgs = {inherit inputs;};
  };
}
