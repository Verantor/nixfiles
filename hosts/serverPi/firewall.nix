{ config, pkgs, ... }:
{
  networking.firewall = {
    enable = false;
    allowPing = false;
    allowedTCPPorts = [ 8080 80 443 22 4533 9000 9091 4747 8082 6680 ];
    allowedUDPPorts = [ 51820 ];
  };
}
