{ lib, ... }: {
  vpnnamespaces.wg = {
    accessibleFrom = lib.mkForce [
      "192.168.178.0/24"
    ];
  };
  nixarr = {
    enable = true;
    mediaDir = "/data/media";
    stateDir = "/data/media/.state/nixarr";
    vpn = {
      enable = true;
      #vpnTestService.enable = true;
      wgConf = "/data/wg.conf";
    };
    transmission = {
      # on port 9091
      enable = true;
      #peerPort = 51413;
      vpn.enable = true;
      flood.enable = false;
      openFirewall = true;
      #peerPort = 50000; # Set this to the port forwarded by your VPN
      extraAllowedIps = [ "192.168.0.*,192.168.15.1,127.0.0.1,192.168.*" ];
    };
    sonarr = {
      # on port 8989
      enable = true;
      openFirewall = true;
      vpn.enable = true;
    };
    radarr = {
      # on port 7878
      enable = true;
      openFirewall = true;
      vpn.enable = true;
    };
    prowlarr.enable = true; # on port 9696
    #bazarr.enable = true;
    jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };
}
