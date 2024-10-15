{ ... }: {
  services.immich = {
    enable = true;
    database = {
      enable = true;
      createDB = true;
      name = "immich";
      user = "immich";
      port = 5432;
    };
    redis = {
      enable = true;
    };
    machine-learning = {
      enable = true;
    };

    host = "0.0.0.0";
    openFirewall = true;
    mediaLocation = "/var/lib/immich";
    port = 3001;
  };
}
