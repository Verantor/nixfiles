{ config, pkgs, lib, ... }:

let
  user = "ver";
  password = "christoph99";
  SSID = "FBA";
  SSIDpassword = "almdudler";
  interface = "wlan0";
  hostname = "cu2";
in {
imports = [

  "${fetchTarball "https://github.com/NixOS/nixos-hardware/tarball/master"}/raspberry-pi/4"
  ./hardware-configuration.nix
];


  networking = {
    hostName = hostname;
    wireless = {
      enable = true;
      networks."${SSID}".psk = SSIDpassword;
      interfaces = [ interface ];
    };
    interfaces.eth0.useDHCP = true;
    interfaces.wlan0.useDHCP = true;
    firewall.allowedTCPPorts = [ 80 7125 ];
  };
  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
  environment.systemPackages = with pkgs; [     git
    wget
    htop
    vim
    tmux
    libraspberrypi ];

  services.openssh.enable = true;

  users = {
    mutableUsers = false;
    users."${user}" = {
      isNormalUser = true;
      password = password;
      extraGroups = [ "wheel" ];
    };
    users.root ={
      openssh.authorizedKeys.keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBMSLJdX3c3bgudmooK2+W6iKCFNvMhS/PdBvRntgXRo";
    };
  };



   services.octoprint = {
    enable = true;
    
    plugins = [];
    
};
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "23.11";
}
