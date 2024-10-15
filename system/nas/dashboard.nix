{ ... }:
let
  localIp = "192.168.178.44";
in
{
  services.homepage-dashboard = {
    enable = true;
    listenPort = 8080;
    openFirewall = true;
    # bookmarks = [
    #   {
    #     Developer = [
    #       {
    #         Github = [
    #           {
    #             abbr = "GH";
    #             href = "https://github.com/";
    #           }
    #         ];
    #       }
    #     ];
    #   }
    #   {
    #     Entertainment = [
    #       {
    #         YouTube = [
    #           {
    #             abbr = "YT";
    #             href = "https://youtube.com/";
    #           }
    #         ];
    #       }
    #     ];
    #   }
    # ];
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
            "Immich" = {
              description = "Immich Photo Gallery";
              href = "http://${localIp}:3001/";
            };
          }
        ];
      }
      {
        "Services" = [
          {
            "mealie" = {
              description = "Mealie Rezeptebuch";
              href = "http://${localIp}:9000/";
            };
          }
        ];
      }
    ];
  };
}
