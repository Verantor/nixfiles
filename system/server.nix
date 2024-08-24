{ pkgs
, lib
, config
, ...
}:
let
  domain = "katzenklapse.duckdns.org";
in
{
  # services.trilium-server = {
  #   enable = true;
  #   port = 8080;
  #   host = "0.0.0.0";
  # };
  networking.nat.enable = true;
  networking.nat.externalInterface = "eth0";
  networking.nat.internalInterfaces = [ "wg0" ];
  networking.firewall = {
    enable = lib.mkForce false;
    allowedUDPPorts = [ 25565 22 ];
  };

  sops.secrets."wireguardPrivateKey" = { };
  networking.wireguard.interfaces = {
    # "wg0" is the network interface name. You can name the interface arbitrarily.
    wg0 = {
      # Determines the IP address and subnet of the server's end of the tunnel interface.
      ips = [ "192.168.100.1/24" ];

      # The port that WireGuard listens to. Must be accessible by the client.
      listenPort = 25565;

      # This allows the wireguard server to route your traffic to the internet and hence be like a VPN
      # For this to work you have to set the dnsserver IP of your router (or dnsserver of choice) in your clients
      postSetup = ''
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 192.168.100.0/24 -o eth0 -j MASQUERADE
      '';

      # This undoes the above command
      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 192.168.100.0/24 -o eth0 -j MASQUERADE
      '';

      # Path to the private key file.
      #
      # Note: The private key can also be included inline via the privateKey option,
      # but this makes the private key world-readable; thus, using privateKeyFile is
      # recommended.
      privateKeyFile = config.sops.secrets."wireguardPrivateKey".path;

      peers = [
        # List of allowed peers.
        {
          # Feel free to give a meaning full name
          # Public key of the peer (not a file path).
          publicKey = "nFTWv6klfk1BB0lm21h/a1yUBnvGUzFhuJJDOUH4/1k=";
          # List of IPs assigned to this peer within the tunnel subnet. Used to configure routing.
          allowedIPs = [ "192.168.100.2/32" ];
          endpoint = "${domain}:25565";
          persistentKeepalive = 25;
        }
        # {
        #   # John Doe
        #   publicKey = "{john doe's public key}";
        #   allowedIPs = ["192.168.100.3/32"];
        # }
      ];
    };
  };

  # services.vaultwarden = {
  #   enable = true;
  #   environmentFile = "/run/secrets/vaultwarden";
  #   backupDir = "/var/backup/vaultwarden";
  #   config = {
  #     SMTP_PORT = 465;
  #     SMTP_FROM_NAME = "Vaultwarden";
  #     SMTP_SECURITY = "force_tls";
  #     SIGNUPS_ALLOWED = false;
  #     DOMAIN = "https://bitwarden.${domain}";
  #     SHOW_PASSWORD_HINT = false;
  #     ROCKET_ADDRESS = "127.0.0.1";
  #     ROCKET_PORT = 8222;
  #     ROCKET_LOG = "critical";
  #   };
  # };
}
