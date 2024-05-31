{ ... }:
let ip = "http://192.168.178.190";
in {
  services.homepage-dashboard = {
    enable = true;
    listenPort = 8082;
    openFirewall = true;
    settings = {
      title = "Homepage Dashboard";
    };
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
          provider = "google";
          target = "_blank";
        };
      }
    ];
    services = [
      {
        "Media" = [
          {
            "Gonic" = {
              description = "Gonic";
              href = ip + ":4747";
            };
          }
          {
            "Jellyfin" = {
              description = "Jellyfin";
              href = ip + ":8096";
            };
          }
        ];
      }
      {
        "Services" = [
          {
            "Audiobookshelf" = {
              description = "Audiobookshelf";
              href = ip + ":8081";
            };
          }
          {
            "Mealie" = {
              description = "Mealie";
              href = ip + ":9000";
            };
          }
          {
            "Shiori" = {
              description = "Shiori";
              href = ip + ":8080";
            };
          }
          {
            "Paperless" = {
              description = "Paperless";
              href = ip + ":8000";
            };
          }
        ];
      }
      {
        "Arr" = [
          {
            "transmission" = {
              description = "Transmission";
              href = ip + ":9091";
            };
          }
          {
            "sonarr" = {
              description = "Sonarr";
              href = ip + ":8989";
            };
          }
          {
            "radarr" = {
              description = "Radarr";
              href = ip + ":7878";
            };
          }
          {
            "prowlarr" = {
              description = "Proarr";
              href = ip + ":9696";
            };
          }
        ];
      }
    ];
  };
}
