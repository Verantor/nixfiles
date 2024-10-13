{ pkgs, ... }: {
  # services.mealie = {
  #   enable = true;
  #   port = 9000;
  # };
  services.audiobookshelf = {
    enable = true;
    host = "0.0.0.0";
    port = 8000;
    openFirewall = true;
  };
  services.navidrome = {
    enable = true;
    settings = {
      MusicFolder = "/data/Music";
      Port = 4533;
      Address = "0.0.0.0";
      # LogLevel = "DEBUG";
      Jukebox = {
        Enabled = true;
        AdminOnly = false;
        Default = "dac";
        Devices = [
          [ "dac" "alsa/front:CARD=DAC,DEV=0" ]
        ];
      };
    };
  };
}
