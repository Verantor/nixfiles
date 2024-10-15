{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    vim
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


}
