{ ... }: {
  # services.audiobookshelf = {
  #   enable = true;
  #   port = 8081;
  #   host = "192.168.178.190";
  #   openFirewall = true;
  # };
  # services.mealie = {
  #   enable = true;
  #   port = 9000;
  # };
  # services.shiori = {
  #   # on port 8080
  #   enable = true;
  #   port = 8080;
  # };
  # services.paperless = {
  #   enable = true;
  #   port = 8000;
  #   mediaDir = "/data/documents";
  #   dataDir = "/data/paperless";
  #   openMPThreadingWorkaround = true;
  #   extraConfig = {
  #     PAPERLESS_OCR_LANGUAGE = "deu+eng";

  #     PAPERLESS_OCR_USER_ARGS = builtins.toJSON {
  #       optimize = 1;
  #       pdfa_image_compression = "lossless";
  #     };
  #   };

  # };
}
