{ pkgs, ... }: {

  networking.networkmanager.enable = true;
  networking.interfaces.eth0.wakeOnLan.enable = true;
  # networking.firewall.allowedTCPPorts = [
  #   47984
  #   47989
  #   48010
  #   {
  #     from = 1714;
  #     to = 1764;
  #   }
  #   57621
  # ];
  # networking.firewall.allowedUDPPorts = [
  #   {
  #     from = 47998;
  #     to = 48000;
  #   }
  #   48002
  #   48010
  #   {
  #     from = 1714;
  #     to = 1764;
  #   }
  #   5353
  # ];
  networking.firewall.enable = false;




}
