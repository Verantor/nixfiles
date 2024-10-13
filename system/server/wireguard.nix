{ lib
, pkgs
, config
, ...
}:
let
  domain = "katzenklapse.duckdns.org";
  localIp = "192.168.178.190";
in
{
  networking.nat.enable = true;
  networking.nat.externalInterface = "eth0";
  networking.nat.internalInterfaces = [ "wg0" ];
  networking.useNetworkd = true;
  networking.firewall = {
    enable = lib.mkForce false;
    allowedUDPPorts = [ 25565 22 7125 ];
  };

  sops.secrets."wireguardPrivateKey" = { };
  networking.wireguard.interfaces = {
    wg0 = {
      listenPort = 25565;
      postSetup = ''
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
      '';
      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
      '';
      privateKeyFile = config.sops.secrets."wireguardPrivateKey".path;
      peers = [
        {
          name = "max";
          publicKey = "nFTWv6klfk1BB0lm21h/a1yUBnvGUzFhuJJDOUH4/1k=";
          # List of IPs assigned to this peer within the tunnel subnet. Used to configure routing.
          allowedIPs = [ "10.100.0.2/32" ];
          endpoint = "${domain}:25565";
          # persistentKeepalive = 25;
        }
      ];
    };
  };
}
