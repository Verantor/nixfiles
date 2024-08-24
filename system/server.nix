{
  pkgs,
  lib,
  config,
  ...
}: let
  domain = "katzenklapse.duckdns.org";
  localIp = "192.168.178.190";
in {
  # services.trilium-server = {
  #   enable = true;
  #   port = 8080;
  #   host = "0.0.0.0";
  # };
  networking.nat.enable = true;
  networking.nat.externalInterface = "eth0";
  networking.nat.internalInterfaces = ["wg0"];
  networking.useNetworkd = true;
  networking.firewall = {
    enable = lib.mkForce false;
    allowedUDPPorts = [25565 22];
  };

  sops.secrets."wireguardPrivateKey" = {};
  networking.wireguard.interfaces = {
    # "wg0" is the network interface name. You can name the interface arbitrarily.
    wg0 = {
      # Determines the IP address and subnet of the server's end of the tunnel interface.
      ips = ["10.100.0.1/24"];

      # The port that WireGuard listens to. Must be accessible by the client.
      listenPort = 25565;

      # This allows the wireguard server to route your traffic to the internet and hence be like a VPN
      # For this to work you have to set the dnsserver IP of your router (or dnsserver of choice) in your clients
      postSetup = ''
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
      '';

      # This undoes the above command
      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
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
          name = "max";
          # Feel free to give a meaning full name
          # Public key of the peer (not a file path).
          publicKey = "nFTWv6klfk1BB0lm21h/a1yUBnvGUzFhuJJDOUH4/1k=";
          # List of IPs assigned to this peer within the tunnel subnet. Used to configure routing.
          # allowedIPs = ["10.100.0.2/32"];
          allowedIPs = ["10.100.0.2/32"];
          endpoint = "${domain}:25565";
          # persistentKeepalive = 25;
        }
        # {
        #   # John Doe
        #   publicKey = "{john doe's public key}";
        #   allowedIPs = ["10.100.0.3/32"];
        # }
      ];
    };
  };
  services.mealie = {
    enable = true;
    port = 9000;
  };
  services.homepage-dashboard = {
    enable = true;
    listenPort = 8888;
    openFirewall = true;
    bookmarks = [
      {
        Developer = [
          {
            Github = [
              {
                abbr = "GH";
                href = "https://github.com/";
              }
            ];
          }
        ];
      }
      {
        Entertainment = [
          {
            YouTube = [
              {
                abbr = "YT";
                href = "https://youtube.com/";
              }
            ];
          }
        ];
      }
    ];
    widgets = [
      {
        resources = {
          cpu = true;
          disk = "/";
          memory = true;
        };
      }
      {
        search = {
          provider = "duckduckgo";
          target = "_blank";
        };
      }
    ];
    services = [
      {
        "Services" = [
          {
            "memos" = {
              description = "memos notes";
              href = "http://${localIp}:5230/";
            };
          }
          {
            "mealie" = {
              description = "mealie recepies";
              href = "http://${localIp}:9000/";
            };
          }
          {
            "navidrome" = {
              description = "navidrome music";
              href = "http://${localIp}:4533/";
            };
          }
        ];
      }
    ];
  };

  services.navidrome = {
    enable = true;
    settings = {
      MusicFolder = "/data/Music";
      Port = 4533;
      Address = "0.0.0.0";
    };
  };

  # Runtime
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    dockerCompat = true;
    defaultNetwork.settings = {
      # Required for container networking to be able to use names.
      dns_enabled = true;
    };
  };
  virtualisation.oci-containers.backend = "podman";

  # Containers
  virtualisation.oci-containers.containers."memos" = {
    image = "neosmemo/memos:stable";
    volumes = [
      "/home/ver/.memos:/var/opt/memos:rw"
    ];
    ports = [
      "5230:5230/tcp"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=memos"
      "--network=memos_default"
    ];
  };
  systemd.services."podman-memos" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "no";
    };
    after = [
      "podman-network-memos_default.service"
    ];
    requires = [
      "podman-network-memos_default.service"
    ];
    partOf = [
      "podman-compose-memos-root.target"
    ];
    wantedBy = [
      "podman-compose-memos-root.target"
    ];
  };

  # Networks
  systemd.services."podman-network-memos_default" = {
    path = [pkgs.podman];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "podman network rm -f memos_default";
    };
    script = ''
      podman network inspect memos_default || podman network create memos_default
    '';
    partOf = ["podman-compose-memos-root.target"];
    wantedBy = ["podman-compose-memos-root.target"];
  };

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."podman-compose-memos-root" = {
    unitConfig = {
      Description = "Root target generated by compose2nix.";
    };
    wantedBy = ["multi-user.target"];
  };
  # nixarr = {
  #   enable = true;
  #   # These two values are also the default, but you can set them to whatever
  #   # else you want
  #   # WARNING: Do _not_ set them to `/home/user/whatever`, it will not work!
  #   mediaDir = "/data/media";
  #   stateDir = "/data/media/.state/nixarr";
  #
  #   vpn = {
  #     enable = true;
  #     # WARNING: This file must _not_ be in the config git directory
  #     # You can usually get this wireguard file from your VPN provider
  #     wgConf = "/data/.secret/wg.conf";
  #   };
  #
  #   jellyfin = {
  #     enable = true;
  #     # These options set up a nginx HTTPS reverse proxy, so you can access
  #     # Jellyfin on your domain with HTTPS
  #   };
  #
  #   transmission = {
  #     enable = true;
  #     vpn.enable = true;
  #     peerPort = 50000; # Set this to the port forwarded by your VPN
  #   };
  #
  #   # It is possible for this module to run the *Arrs through a VPN, but it
  #   # is generally not recommended, as it can cause rate-limiting issues.
  #   # bazarr.enable = true;
  #   # lidarr.enable = true;
  #   prowlarr.enable = true;
  #   radarr.enable = true;
  #   # readarr.enable = true;
  #   sonarr.enable = true;
  # };
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
