{ pkgs, lib, ... }: {

  # networking = {
  #   wireless = {
  #     enable = true;
  #     networks."FBA".psk = "password";
  #     interfaces = [ "wlan0" ];
  #   };
  #   interfaces.eth0.useDHCP = true;
  #   interfaces.wlan0.useDHCP = true;
  #   firewall.allowedTCPPorts = [ 80 7125 ];
  # };

  hardware.enableRedistributableFirmware = true;
}
