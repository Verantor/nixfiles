{ config, pkgs, lib, ... }:


{
  imports = [
    ./hardware-configuration.nix
    ./firewall.nix
    #./services.nix
    #./nixarr.nix
    #./homepage.nix
    #./gonic.nix
    ./ssh.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    wget
    htop
    vim
    tmux
    libraspberrypi
    raspberrypi-eeprom
    wireguard-tools
    mpv
  ];
  networking.nameservers = [ "1.1.1.2" "1.0.0.2" ];

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";

  users.groups.media = { };

  # services.navidrome = {
  #   # on port 4533
  #   enable = true;
  #   settings = {
  #     Address = "192.168.178.190";
  #     Port = 4533;
  #     MusicFolder = "/data/music";
  #   };
  #   openFirewall = true;
  # };





  hardware = {
    raspberry-pi."4".apply-overlays-dtmerge.enable = true;
    deviceTree = {
      enable = true;
      filter = lib.mkForce "*rpi-4-*.dtb"; #force is useles probably the same value on both
    };
  };
  console.enable = false;
  hardware.raspberry-pi."4".fkms-3d.enable = true;
}
