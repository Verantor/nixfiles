{ config, ... }: {
  services.photoprism = {
    enable = true;
    port = 2342;
    originalsPath = "/data/photos";
    importPath = "/data/import";
  };
}
