{ ... }:
let
  localIp = "192.168.178.190";
in
{
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
        "Media" = [
          {
            "navidrome" = {
              description = "navidrome music";
              href = "http://${localIp}:4533/";
            };
          }
          {
            "audiobookshelf" = {
              description = "audiobookshelf audiobooks and podcasts";
              href = "http://${localIp}:8000/";
            };
          }
        ];
      }
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
            "xandikos" = {
              description = "xandikos calendar";
              href = "http://${localIp}:7777/";
            };
          }
        ];
      }
    ];
  };
}
